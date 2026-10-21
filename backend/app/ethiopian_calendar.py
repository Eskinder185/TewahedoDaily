"""Beyene–Kudlek Ethiopian calendar + next-occurrence from EOTC JSON.

Aligned with frontend `ethiopianDate.ts` / `nextCommemoration.ts`.
Loads TewahedoDaily `src/data/eotc_calendar_json` when present; otherwise uses
built-in Saint Michael records. Never invents feast dates.
"""
from __future__ import annotations

from dataclasses import dataclass
from datetime import date, datetime, timedelta
from functools import lru_cache
from pathlib import Path
from zoneinfo import ZoneInfo
import json
import re

ETHIOPIC_JDN_OFFSET = 1723856

ETHIOPIAN_MONTH_NAMES = (
    "Meskerem",
    "Tikimt",
    "Hidar",
    "Tahsas",
    "Tir",
    "Yekatit",
    "Megabit",
    "Miyazya",
    "Ginbot",
    "Sene",
    "Hamle",
    "Nehasse",
    "Pagumen",
)

MONTH_ALIASES = {
    "tekemt": 2,
    "teqemt": 2,
    "tikimt": 2,
    "hedar": 3,
    "hidar": 3,
    "sene": 10,
    "senne": 10,
    "ter": 5,
    "nehase": 12,
    "nehassie": 12,
}

SUBJECT_ALIASES: list[tuple[re.Pattern[str], str]] = [
    (re.compile(r"\b(st\.?\s*)?michael\b|mikael|ሚካኤል", re.I), "michael"),
    (re.compile(r"\b(st\.?\s*)?gabriel\b|ገብርኤል", re.I), "gabriel"),
    (re.compile(r"\b(st\.?\s*)?raphael\b|ራፋኤል", re.I), "raphael"),
    (re.compile(r"\bmary\b|mariam|ማርያም|theotokos|filseta", re.I), "mary"),
    (re.compile(r"\b(st\.?\s*)?george\b|georgios|ጊዮርጊስ", re.I), "georgios"),
    (re.compile(r"\byared\b|ያሬድ", re.I), "yared"),
    (re.compile(r"\btekle\s*haymanot\b|ተክለ\s*ሃይማኖት", re.I), "tekle haymanot"),
    (re.compile(r"\bjohn\s+the\s+baptist\b|መጥምቅ", re.I), "john the baptist"),
    (re.compile(r"\bprophets?\s+fast\b|\badvent\s+fast\b|tsome\s+nebiyat|ጾመ\s*ነቢያት", re.I), "prophets"),
    (re.compile(r"\bapostles?\s+fast\b|tsome\s+hawariat", re.I), "apostles"),
    (re.compile(r"\bdormition\s+fast\b|tsome\s+filseta", re.I), "dormition fast"),
]

STOPWORDS = {
    "when", "is", "the", "a", "an", "of", "for", "about", "tell", "me", "please",
    "next", "upcoming", "coming", "what", "which", "saint", "st", "holy",
    "commemoration", "feast", "observance", "memorial", "day", "days", "month",
    "monthly", "annual", "major", "church", "ethiopian", "orthodox", "eotc",
    "date", "calendar", "fast", "fasting", "period", "event", "events",
}

# Fallback when JSON dataset is unavailable (still correct for Michael).
MICHAEL_MONTHLY_DAY = 12
MICHAEL_ANNUAL = (("Hidar", 12), ("Sene", 12))


@dataclass(frozen=True)
class EthDate:
    year: int
    month: int
    day: int

    def label(self) -> str:
        name = ETHIOPIAN_MONTH_NAMES[self.month - 1] if 1 <= self.month <= 13 else "—"
        return f"{name} {self.day}, {self.year} E.C."


def _mod(i: int, j: int) -> int:
    return i - j * (i // j)


def gregorian_to_jdn(year: int, month: int, day: int) -> int:
    a = (14 - month) // 12
    y = year + 4800 - a
    m = month + 12 * a - 3
    return (
        day
        + (153 * m + 2) // 5
        + 365 * y
        + y // 4
        - y // 100
        + y // 400
        - 32045
    )


def gregorian_to_ethiopian(d: date) -> EthDate:
    jdn = gregorian_to_jdn(d.year, d.month, d.day)
    r = _mod(jdn - ETHIOPIC_JDN_OFFSET, 1461)
    n = _mod(r, 365) + 365 * (r // 1460)
    eth_year = 4 * ((jdn - ETHIOPIC_JDN_OFFSET) // 1461) + (r // 365) - (r // 1460)
    eth_month = n // 30 + 1
    eth_day = _mod(n, 30) + 1
    return EthDate(eth_year, eth_month, eth_day)


def ethiopian_month_length(eth_year: int, eth_month: int) -> int:
    if 1 <= eth_month <= 12:
        return 30
    return 6 if eth_year % 4 == 3 else 5


def ethiopian_to_gregorian(eth_year: int, eth_month: int, eth_day: int) -> date:
    start = date(eth_year + 7, 8, 1)
    for i in range(450):
        g = start + timedelta(days=i)
        e = gregorian_to_ethiopian(g)
        if e.year == eth_year and e.month == eth_month and e.day == eth_day:
            return g
    return start


def next_monthly_day_on_or_after(ref: date, day: int) -> tuple[EthDate, date] | None:
    if day < 1 or day > 30:
        return None
    for i in range(40):
        g = ref + timedelta(days=i)
        e = gregorian_to_ethiopian(g)
        if day > ethiopian_month_length(e.year, e.month):
            continue
        if e.day == day:
            return e, g
    return None


def next_fixed_on_or_after(ref: date, eth_month: int, eth_day: int) -> tuple[EthDate, date] | None:
    e0 = gregorian_to_ethiopian(ref)
    for year in range(e0.year, e0.year + 3):
        if eth_day > ethiopian_month_length(year, eth_month):
            continue
        g = ethiopian_to_gregorian(year, eth_month, eth_day)
        if g >= ref:
            return EthDate(year, eth_month, eth_day), g
    return None


def month_number(name: str | int | None) -> int | None:
    if isinstance(name, int):
        return name if 1 <= name <= 13 else None
    if not name:
        return None
    key = str(name).strip().lower()
    for i, n in enumerate(ETHIOPIAN_MONTH_NAMES, 1):
        if n.lower() == key:
            return i
    return MONTH_ALIASES.get(key)


def format_gregorian(d: date) -> str:
    return f"{d.strftime('%B')} {d.day}, {d.year}"


def civil_today(timezone_name: str | None = None) -> date:
    tz = timezone_name or "Africa/Addis_Ababa"
    try:
        zone = ZoneInfo(tz)
    except Exception:
        zone = ZoneInfo("Africa/Addis_Ababa")
    return datetime.now(zone).date()


def is_next_occurrence_query(text: str) -> bool:
    q = (text or "").lower()
    if re.search(r"\b(next|upcoming|coming)\b", q) and re.search(
        r"\b(commemoration|feast|observance|memorial|fast(?:ing)?|saint|day|event)\b", q
    ):
        return True
    if re.search(r"\bwhen\s+(is|does|will)\b", q) and re.search(
        r"\b(commemoration|feast|observance|fast(?:ing)?|saint|michael|gabriel|mary)\b", q
    ):
        return True
    if any(t in (text or "") for t in ("መቼ", "ቀጣይ", "የሚመጣው", "መጪው")):
        return True
    return False


def detect_subject(text: str) -> str | None:
    q = text or ""
    for pattern, subject in SUBJECT_ALIASES:
        if pattern.search(q):
            return subject
    cleaned = re.sub(r"[^\w\s\u1200-\u137F]", " ", q, flags=re.UNICODE)
    tokens = [
        t for t in cleaned.split()
        if len(t) > 1 and t.lower() not in STOPWORDS
    ]
    if len(tokens) >= 1:
        joined = " ".join(tokens)
        if len(joined) >= 2:
            return joined
    return None


def _eotc_json_roots() -> list[Path]:
    here = Path(__file__).resolve()
    # Layouts:
    # - TewahedoDaily/backend/app/*.py → parents[2] = TewahedoDaily
    # - tewahedo-ai/app/*.py → parents[1] = tewahedo-ai, sibling TewahedoDaily
    candidates = [
        here.parents[2] / "src" / "data" / "eotc_calendar_json",
        here.parents[1].parent / "TewahedoDaily" / "src" / "data" / "eotc_calendar_json",
        here.parents[2] / "TewahedoDaily" / "src" / "data" / "eotc_calendar_json",
    ]
    return [p for p in candidates if p.is_dir()]


@lru_cache(maxsize=1)
def load_eotc_entries() -> tuple[dict, ...]:
    roots = _eotc_json_roots()
    if not roots:
        return tuple()
    root = roots[0]
    entries: list[dict] = []
    for name in (
        "angels.json",
        "monthly-commemorations.json",
        "major-saints.json",
        "mary.json",
        "fixed-feasts.json",
        "fasts.json",
    ):
        path = root / name
        if not path.is_file():
            continue
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError):
            continue
        for entry in data.get("entries") or []:
            if isinstance(entry, dict):
                row = dict(entry)
                row["_collection"] = data.get("name") or name
                entries.append(row)
    return tuple(entries)


def _entry_blob(entry: dict) -> str:
    parts = [
        entry.get("id"),
        entry.get("title"),
        entry.get("englishTitle"),
        entry.get("transliterationTitle"),
        *([str(k) for k in (entry.get("searchKeywords") or [])]),
    ]
    return " ".join(p for p in parts if p).lower()


def score_entry(entry: dict, subject: str) -> int:
    blob = _entry_blob(entry)
    sub = subject.lower().strip()
    if not sub:
        return 0
    score = 0
    if sub in blob:
        score += 10
    for token in sub.split():
        if len(token) > 2 and token in blob:
            score += 3
    kind = (entry.get("date") or {}).get("kind")
    if kind in ("monthly-recurring", "fixed", "season"):
        score += 1
    return score


def michael_fallback_answer(ref: date) -> dict:
    monthly = next_monthly_day_on_or_after(ref, MICHAEL_MONTHLY_DAY)
    annuals = []
    for name, day in MICHAEL_ANNUAL:
        m = month_number(name)
        if not m:
            continue
        hit = next_fixed_on_or_after(ref, m, day)
        if hit:
            annuals.append((name, hit))
    annuals.sort(key=lambda x: x[1][1])
    ref_eth = gregorian_to_ethiopian(ref)
    lines: list[str] = []
    facts: dict = {
        "reference_gregorian": ref.isoformat(),
        "reference_ethiopian": ref_eth.label(),
        "monthly": None,
        "next_annual": None,
        "other_annual": [],
        "found": True,
    }
    if monthly:
        e, g = monthly
        lines.append(
            f"Next monthly Saint Michael Monthly Commemoration: {e.label()} — {format_gregorian(g)}."
        )
        facts["monthly"] = {"ethiopian": e.label(), "gregorian": g.isoformat()}
    if annuals:
        name0, (e, g) = annuals[0]
        lines.append(f"Next major annual feast: {e.label()} — {format_gregorian(g)}.")
        facts["next_annual"] = {
            "ethiopian": e.label(),
            "gregorian": g.isoformat(),
            "month_name": name0,
        }
        for name, (e, g) in annuals[1:]:
            lines.append(
                f"Also recorded: Archangel Michael ({name} {e.day}) on {e.label()} — {format_gregorian(g)}."
            )
            facts["other_annual"].append(
                {"ethiopian": e.label(), "gregorian": g.isoformat(), "month_name": name}
            )
    lines.append(f"Reference date: {format_gregorian(ref)} ({ref_eth.label()}).")
    lines.append("Dates are calculated from the app calendar (not model estimates).")
    return {"answer": "\n".join(lines), "facts": facts, "verified": True}


def _project_entry(ref: date, entry: dict) -> dict:
    """Return monthly / annual / fast_start hits for one entry."""
    d = entry.get("date") or {}
    kind = d.get("kind")
    title = (entry.get("englishTitle") or entry.get("title") or "").strip()
    out: dict = {"monthly": None, "annuals": [], "fasts": []}
    if kind == "monthly-recurring":
        day = d.get("monthlyRecurringDay")
        if isinstance(day, int):
            hit = next_monthly_day_on_or_after(ref, day)
            if hit:
                e, g = hit
                out["monthly"] = {
                    "title": title,
                    "ethiopian": e.label(),
                    "gregorian": g.isoformat(),
                    "entry_id": entry.get("id"),
                    "g": g,
                }
    if kind == "fixed":
        m = month_number(d.get("ethiopianMonth"))
        day = d.get("ethiopianDay")
        if m and isinstance(day, int):
            hit = next_fixed_on_or_after(ref, m, day)
            if hit:
                e, g = hit
                out["annuals"].append(
                    {
                        "title": title,
                        "ethiopian": e.label(),
                        "gregorian": g.isoformat(),
                        "entry_id": entry.get("id"),
                        "g": g,
                    }
                )
    if kind == "season":
        sr = d.get("seasonRange") or {}
        sf = sr.get("startFixed") or {}
        m = month_number(sf.get("ethiopianMonth"))
        day = sf.get("ethiopianDay")
        if m and isinstance(day, int):
            hit = next_fixed_on_or_after(ref, m, day)
            if hit:
                e, g = hit
                out["fasts"].append(
                    {
                        "title": title,
                        "ethiopian": e.label(),
                        "gregorian": g.isoformat(),
                        "entry_id": entry.get("id"),
                        "g": g,
                    }
                )
    return out


def next_occurrence_answer(question: str, ref: date) -> dict:
    """Build verified answer or abstention from EOTC dataset / Michael fallback."""
    ref_eth = gregorian_to_ethiopian(ref)
    subject = detect_subject(question)
    prefer_amharic = bool(re.search(r"[\u1200-\u137F]", question or ""))

    def abstain(subj: str | None) -> dict:
        en = (
            "I do not have a verified date for that in the TewahedoDaily church calendar "
            "dataset, so I will not guess. "
            f"Reference date: {format_gregorian(ref)} ({ref_eth.label()})."
        )
        am = (
            "በተረጋገጠ የቤተ ክርስቲያን የቀን መቁጠሪያ መረጃ ውስጥ ለዚህ ጥያቄ ቀን አላገኘሁም፤ ስለዚህ አልገምትም። "
            f"የማጣቀሻ ቀን፦ {format_gregorian(ref)} ({ref_eth.label()})።"
        )
        return {
            "answer": am if prefer_amharic else en,
            "facts": {
                "reference_gregorian": ref.isoformat(),
                "reference_ethiopian": ref_eth.label(),
                "monthly": None,
                "next_annual": None,
                "other_annual": [],
                "found": False,
                "subject": subj,
            },
            "verified": True,
        }

    if not subject:
        return abstain(None)

    # Michael fallback when dataset missing.
    entries = load_eotc_entries()
    if not entries and subject == "michael":
        return michael_fallback_answer(ref)
    if not entries:
        return abstain(subject)

    matched = sorted(
        ((score_entry(e, subject), e) for e in entries),
        key=lambda x: -x[0],
    )
    matched = [e for s, e in matched if s >= 10]
    if not matched:
        if subject == "michael":
            return michael_fallback_answer(ref)
        return abstain(subject)

    monthly = None
    annuals: list[dict] = []
    fasts: list[dict] = []
    for entry in matched:
        proj = _project_entry(ref, entry)
        if proj["monthly"] and (
            monthly is None or proj["monthly"]["g"] < monthly["g"]
        ):
            monthly = proj["monthly"]
        annuals.extend(proj["annuals"])
        fasts.extend(proj["fasts"])

    annuals.sort(key=lambda x: x["g"])
    fasts.sort(key=lambda x: x["g"])
    if not monthly and not annuals and not fasts:
        if subject == "michael":
            return michael_fallback_answer(ref)
        return abstain(subject)

    lines: list[str] = []
    facts: dict = {
        "reference_gregorian": ref.isoformat(),
        "reference_ethiopian": ref_eth.label(),
        "monthly": None,
        "next_annual": None,
        "other_annual": [],
        "found": True,
        "subject": subject,
    }
    if monthly:
        lines.append(
            f"Next monthly {monthly['title']}: {monthly['ethiopian']} — "
            f"{format_gregorian(date.fromisoformat(monthly['gregorian']))}."
        )
        facts["monthly"] = {
            "ethiopian": monthly["ethiopian"],
            "gregorian": monthly["gregorian"],
            "entry_id": monthly.get("entry_id"),
        }
    if annuals:
        a0 = annuals[0]
        lines.append(
            f"Next major annual feast: {a0['title']} on {a0['ethiopian']} — "
            f"{format_gregorian(date.fromisoformat(a0['gregorian']))}."
        )
        facts["next_annual"] = {
            "ethiopian": a0["ethiopian"],
            "gregorian": a0["gregorian"],
            "entry_id": a0.get("entry_id"),
        }
        for extra in annuals[1:]:
            lines.append(
                f"Also recorded: {extra['title']} on {extra['ethiopian']} — "
                f"{format_gregorian(date.fromisoformat(extra['gregorian']))}."
            )
            facts["other_annual"].append(
                {
                    "ethiopian": extra["ethiopian"],
                    "gregorian": extra["gregorian"],
                    "entry_id": extra.get("entry_id"),
                }
            )
    if fasts:
        f0 = fasts[0]
        lines.append(
            f"Next fasting period begins: {f0['title']} on {f0['ethiopian']} — "
            f"{format_gregorian(date.fromisoformat(f0['gregorian']))}."
        )
    lines.append(f"Reference date: {format_gregorian(ref)} ({ref_eth.label()}).")
    lines.append("Dates are calculated from the app calendar dataset (not model estimates).")

    answer = "\n".join(lines)
    if prefer_amharic and facts.get("monthly"):
        answer = (
            f"ቀጣዩ ወርሃዊ መታሰቢያ፦ {facts['monthly']['ethiopian']} — "
            f"{format_gregorian(date.fromisoformat(facts['monthly']['gregorian']))}።\n"
        )
        if facts.get("next_annual"):
            answer += (
                f"ቀጣዩ ዓመታዊ በዓል፦ {facts['next_annual']['ethiopian']} — "
                f"{format_gregorian(date.fromisoformat(facts['next_annual']['gregorian']))}።\n"
            )
        answer += f"የማጣቀሻ ቀን፦ {format_gregorian(ref)} ({ref_eth.label()})።"

    return {"answer": answer, "facts": facts, "verified": True}


# Back-compat alias used by older tests.
def michael_next_answer(ref: date) -> dict:
    return next_occurrence_answer(
        "When is the next Saint Michael commemoration?",
        ref,
    )


def try_verified_next_commemoration(
    question: str,
    *,
    timezone_name: str | None = None,
    reference: date | None = None,
) -> dict | None:
    """Deterministic Search Buddy payload for next-occurrence calendar questions."""
    if not is_next_occurrence_query(question):
        return None
    ref = reference or civil_today(timezone_name)
    payload = next_occurrence_answer(question, ref)
    facts = payload["facts"]
    return {
        "type": "ai",
        "answer": payload["answer"],
        "message": payload["answer"],
        "calendar_verified": True,
        "calendar_found": bool(facts.get("found")),
        "verified_calendar": {
            "subject": facts.get("subject"),
            "reference_gregorian": facts["reference_gregorian"],
            "reference_ethiopian": facts["reference_ethiopian"],
            "monthly": facts.get("monthly"),
            "next_annual": facts.get("next_annual"),
            "other_annual": facts.get("other_annual") or [],
            "abstained": not bool(facts.get("found")),
        },
        "sources": [],
    }


def verified_calendar_block_for_chat(question: str, ref: date | None = None) -> str | None:
    """Structured facts for Gemma when a next-occurrence query somehow reaches the LLM."""
    if not is_next_occurrence_query(question):
        return None
    payload = next_occurrence_answer(question, ref or date.today())
    facts = payload["facts"]
    return (
        "VERIFIED ETHIOPIAN ORTHODOX CALENDAR FACTS (authoritative for this turn).\n"
        "Answer the user's date question using ONLY these facts. "
        "Preserve every Ethiopian and Gregorian date exactly. "
        "Do not invent Western feast dates (e.g. September 29 Michaelmas). "
        "Do not discuss the Five Mysteries or unrelated theology. "
        "If found is false, say the calendar has no verified date — do not guess.\n"
        f"found: {facts.get('found')}\n"
        f"Reference: {facts['reference_gregorian']} = {facts['reference_ethiopian']}\n"
        f"Monthly: {facts.get('monthly')}\n"
        f"Next annual: {facts.get('next_annual')}\n"
        f"Other: {facts.get('other_annual')}\n"
        f"Ready answer:\n{payload['answer']}"
    )
