"""
HTML, JSON-LD, Sitemap, and Next.js Flight payload parsers for eotcmedia.com/hymns.
Uses BeautifulSoup4 + deterministic JSON/Flight extraction + strict ግጥም section verification.
"""
from __future__ import annotations
import html as html_mod
import json
import re
from typing import Dict, List, Optional, Tuple
from urllib.parse import quote, unquote, urlparse

try:
    from bs4 import BeautifulSoup
except ImportError:
    BeautifulSoup = None  # type: ignore[assignment]

BASE_URL = "https://eotcmedia.com"

# UI chrome / banner strings inside the ግጥም box that are NOT hymn lyrics
_LYRICS_UI_BANNERS = (
    'በ AI የተጻፈ፣ እባክዎን "Edit" የሚለውን ተጭነው ጽሁፉን በማስተካከል ያግዙን',
    "በ AI የተጻፈ",
    "Your suggestion is pending admin review",
    "Lyrics not yet available",
    "Sign in to add or generate lyrics",
    "Generate with AI",
    "Add lyrics",
    "Submit for review",
    "Fetching transcript…",
    "Reading subtitles…",
    "Formatting with AI…",
)

_PLACEHOLDER_ONLY_RE = re.compile(
    r"^(?:\s*|ግጥም|hymn\s+lyrics|lyrics(?:\s+not\s+yet\s+available)?|sign\s+in.*|"
    r"no\s+lyrics.*|coming\s+soon.*|tbd|n/?a|\.+|-+|_+|\*+|"
    r"\[?(?:music|instrumental|intro|outro)\]?|ግጥም\s*የለም)\s*$",
    re.IGNORECASE | re.DOTALL,
)

_INSTRUMENTAL_TITLE_RE = re.compile(
    r"(?:\binstrumental\s+only\b|\bno\s+vocal(?:s)?\b|በገና\s*ብቻ|ዋሽንት\s*ብቻ|\bflute\s+only\b)",
    re.IGNORECASE,
)


def canonicalize_hymn_url(slug_or_url: str) -> str:
    if not slug_or_url:
        return ""
    raw = str(slug_or_url).strip()
    if raw.startswith("http://") or raw.startswith("https://"):
        parsed = urlparse(raw)
        path_unquoted = unquote(parsed.path)
        parts = [quote(p, safe="") for p in path_unquoted.strip("/").split("/") if p]
        return f"{BASE_URL}/{'/'.join(parts)}"
    slug_clean = unquote(raw.strip("/"))
    if slug_clean.startswith("hymns/"):
        slug_clean = slug_clean[len("hymns/") :]
    return f"{BASE_URL}/hymns/{quote(slug_clean, safe='')}"


def parse_sitemap_xml(xml_text: str) -> Dict[str, List[str]]:
    """Extract detail URLs, singer URLs, and channel URLs from sitemap.xml."""
    locs = re.findall(r"<loc>(.*?)</loc>", xml_text)
    detail_urls: List[str] = []
    singer_urls: List[str] = []
    channel_urls: List[str] = []

    for loc in locs:
        u = loc.strip()
        if "/hymns/" not in u:
            continue
        if "/hymns/channels/" in u:
            channel_urls.append(u)
        elif "/hymns/singer/" in u:
            singer_urls.append(u)
        elif u.rstrip("/") not in (f"{BASE_URL}/hymns", f"{BASE_URL}/hymns/channels"):
            detail_urls.append(u)

    return {
        "detail_urls": detail_urls,
        "singer_urls": singer_urls,
        "channel_urls": channel_urls,
        "all_locs_count": len(locs),
    }


def extract_next_flight_stream(html_text: str) -> str:
    """Decode and concatenate all self.__next_f.push([1, "..."]) chunks."""
    pushes = re.findall(
        r'self\.__next_f\.push\(\[1,"((?:\\.|[^"\\])*)"\]\)</script>', html_text, re.S
    )
    chunks: List[str] = []
    for p in pushes:
        try:
            chunks.append(json.loads('"' + p + '"'))
        except Exception:
            chunks.append(p)
    return "".join(chunks)


def _resolve_flight_lyrics_token(tok: str, flight: str) -> str:
    """Resolve a Flight lyrics token (either inline JSON string or '$XX' chunk reference)."""
    if not tok or tok == "null" or tok == '"$undefined"':
        return ""
    if tok.startswith('"$') and tok.endswith('"'):
        ref_id = tok[2:-1]
        ref_m = re.search(rf"(?:^|\n){re.escape(ref_id)}:T([0-9a-fA-F]+),(.*)", flight, re.S)
        if ref_m:
            raw_stream = ref_m.group(2)
            cut_m = re.search(r'\d+[a-zA-Z]?:\["\$"', raw_stream)
            return raw_stream[: cut_m.start()] if cut_m else raw_stream[:4000]
        return ""
    if tok.startswith('"') and tok.endswith('"'):
        try:
            val = json.loads(tok)
            if isinstance(val, str) and not val.startswith("$"):
                return val
        except Exception:
            return tok.strip('"')
    return ""


def _clean_lyrics_html_to_lines(raw_html_or_text: str) -> List[str]:
    """Convert HTML/text inside the ግጥም section into clean non-UI lyrical lines."""
    if not raw_html_or_text:
        return []
    text = re.sub(r"(?i)<br\s*/?>|</p>|</div>|</blockquote>|</li>|<hr\s*/?>", "\n", raw_html_or_text)
    text = re.sub(r"<[^>]+>", " ", text)
    text = html_mod.unescape(text)
    text = text.replace("\xa0", " ").replace('\\"', '"').replace("\\'", "'")

    lines: List[str] = []
    for raw_line in text.splitlines():
        ln = re.sub(r"\s+", " ", raw_line).strip()
        if not ln:
            continue
        if ln in ("ግጥም", "Edit", "Add lyrics", "Generate with AI", "Submit for review"):
            continue
        if any(banner.lower() in ln.lower() for banner in _LYRICS_UI_BANNERS):
            continue
        # Ignore lines that are purely repeat marks or decorative separators
        if re.match(r'^[\s"“”\'«»\-_=*•·/|\\]+$', ln):
            continue
        lines.append(ln)
    return lines


def inspect_hymn_lyrics_section(
    html_text: str,
    flight_text: str = "",
    title: str = "",
) -> Dict[str, object]:
    """
    Strictly inspect the ግጥም section on an individual hymn detail page per Phase 3 rules.

    Distinguishes:
      - has_lyrics = True, lyrics_verification = 'verified_true'
      - has_lyrics = False, lyrics_verification = 'verified_false'
      - has_lyrics = False, lyrics_verification = 'uncertain'
    """
    found_gitim_heading = False
    dom_has_not_available = False
    dom_has_sign_in_prompt = False
    dom_serif_html = ""
    dom_box_text = ""

    if BeautifulSoup is not None and html_text:
        soup = BeautifulSoup(html_text, "html.parser")
        for h2 in soup.find_all("h2"):
            h2_text = (h2.get_text() or "").strip()
            if "ግጥም" in h2_text:
                found_gitim_heading = True
                # Walk up to the card container holding both the ግጥም header and the lyrics body
                box = h2.parent.parent.parent if (h2.parent and h2.parent.parent) else h2.parent
                if box is not None:
                    b_txt = box.get_text("\n", strip=True)
                    if len(b_txt) > len(dom_box_text):
                        dom_box_text = b_txt
                    if "Lyrics not yet available" in b_txt:
                        dom_has_not_available = True
                    if "Sign in to add or generate lyrics" in b_txt:
                        dom_has_sign_in_prompt = True
                    serif_div = box.find("div", class_=lambda c: c and "font-serif" in c)
                    if serif_div is not None:
                        s_html = str(serif_div)
                        if len(s_html) > len(dom_serif_html):
                            dom_serif_html = s_html

    # Also inspect Flight payload props for the lyrics component
    lyrics_m = re.search(
        r'"lyrics":(null|"\$[^"]+"|"(?:\\.|[^"\\])*"),'
        r'"lyricsSuggestion":(null|"\$[^"]+"|"(?:\\.|[^"\\])*"),'
        r'"aiLyrics":(null|"\$[^"]+"|"(?:\\.|[^"\\])*"),'
        r'"hymnId":(\d+)',
        flight_text,
    )
    hymn_id: Optional[int] = int(lyrics_m.group(4)) if lyrics_m else None
    lyrics_tok = lyrics_m.group(1) if lyrics_m else "null"
    sug_tok = lyrics_m.group(2) if lyrics_m else "null"
    ai_tok = lyrics_m.group(3) if lyrics_m else "null"

    flight_lyrics_html = _resolve_flight_lyrics_token(lyrics_tok, flight_text)
    flight_sug_html = _resolve_flight_lyrics_token(sug_tok, flight_text)
    flight_ai_html = _resolve_flight_lyrics_token(ai_tok, flight_text)

    lyrics_source_kind = "none"
    if flight_lyrics_html.strip() or (lyrics_tok not in ("null", '"$undefined"') and dom_serif_html):
        lyrics_source_kind = "human_verified"
    elif flight_sug_html.strip() or (sug_tok not in ("null", '"$undefined"') and dom_serif_html):
        lyrics_source_kind = "community_suggestion"
    elif flight_ai_html.strip() or (ai_tok not in ("null", '"$undefined"') and dom_serif_html):
        lyrics_source_kind = "ai_transcribed"
    elif dom_serif_html.strip():
        if "በ AI የተጻፈ" in dom_box_text:
            lyrics_source_kind = "ai_transcribed"
        elif "Your suggestion is pending admin review" in dom_box_text:
            lyrics_source_kind = "community_suggestion"
        else:
            lyrics_source_kind = "dom_serif"

    best_raw_lyrics = dom_serif_html or flight_lyrics_html or flight_sug_html or flight_ai_html
    verse_lines = _clean_lyrics_html_to_lines(best_raw_lyrics)
    clean_text = "\n".join(verse_lines).strip()
    char_count = len(re.sub(r"\s+", "", clean_text))
    line_count = len(verse_lines)

    # Check instrumental-only exclusion
    if _INSTRUMENTAL_TITLE_RE.search(title or "") and char_count < 30:
        return {
            "hymn_id": hymn_id,
            "has_lyrics": False,
            "lyrics_verification": "verified_false",
            "lyrics_source_kind": "none",
            "lyrics_char_count": 0,
            "lyrics_line_count": 0,
            "lyrics_reason": "instrumental_recording_without_written_lyrics",
            "lyrics_snippet": "",
        }

    # Check explicit "Lyrics not yet available" / "Sign in to add or generate lyrics"
    if (dom_has_not_available or dom_has_sign_in_prompt) and char_count == 0:
        reasons = []
        if dom_has_not_available:
            reasons.append("Lyrics not yet available")
        if dom_has_sign_in_prompt:
            reasons.append("Sign in to add or generate lyrics")
        return {
            "hymn_id": hymn_id,
            "has_lyrics": False,
            "lyrics_verification": "verified_false",
            "lyrics_source_kind": "none",
            "lyrics_char_count": 0,
            "lyrics_line_count": 0,
            "lyrics_reason": " / ".join(reasons),
            "lyrics_snippet": "",
        }

    # Check if no lyrics exist in either DOM or Flight
    if char_count == 0:
        if not found_gitim_heading and not lyrics_m:
            # Check if page is just a YouTube embed / title / metadata page or malformed
            if "youtube.com/embed/" in html_text or '"videoId"' in flight_text or "application/ld+json" in html_text:
                return {
                    "hymn_id": hymn_id,
                    "has_lyrics": False,
                    "lyrics_verification": "verified_false",
                    "lyrics_source_kind": "none",
                    "lyrics_char_count": 0,
                    "lyrics_line_count": 0,
                    "lyrics_reason": "page_only_embeds_youtube_and_metadata_without_lyrics",
                    "lyrics_snippet": "",
                }
            return {
                "hymn_id": hymn_id,
                "has_lyrics": False,
                "lyrics_verification": "uncertain",
                "lyrics_source_kind": "none",
                "lyrics_char_count": 0,
                "lyrics_line_count": 0,
                "lyrics_reason": "malformed_or_incomplete_page_missing_lyrics_container",
                "lyrics_snippet": "",
            }
        return {
            "hymn_id": hymn_id,
            "has_lyrics": False,
            "lyrics_verification": "verified_false",
            "lyrics_source_kind": "none",
            "lyrics_char_count": 0,
            "lyrics_line_count": 0,
            "lyrics_reason": "empty_lyrics_section_after_gitim_heading",
            "lyrics_snippet": "",
        }

    # Check if text consists only of placeholders, URLs, or navigation
    if _PLACEHOLDER_ONLY_RE.match(clean_text) or all(
        re.match(r"^https?://\S+$", ln, re.I) for ln in verse_lines
    ):
        return {
            "hymn_id": hymn_id,
            "has_lyrics": False,
            "lyrics_verification": "verified_false",
            "lyrics_source_kind": "none",
            "lyrics_char_count": char_count,
            "lyrics_line_count": line_count,
            "lyrics_reason": "placeholder_or_promotional_links_only",
            "lyrics_snippet": "",
        }

    # Check if text is too short / non-substantive or only repeats the title
    norm_title = re.sub(r"\s+", " ", (title or "")).strip().lower()
    if char_count < 20 or (line_count == 1 and norm_title and clean_text.lower() in norm_title):
        return {
            "hymn_id": hymn_id,
            "has_lyrics": False,
            "lyrics_verification": "uncertain",
            "lyrics_source_kind": lyrics_source_kind,
            "lyrics_char_count": char_count,
            "lyrics_line_count": line_count,
            "lyrics_reason": f"ambiguous_short_or_title_only_text ({char_count} chars, {line_count} lines)",
            "lyrics_snippet": clean_text[:250],
        }

    snippet = re.sub(r"\s+", " ", " ".join(verse_lines)).strip()[:300]
    return {
        "hymn_id": hymn_id,
        "has_lyrics": True,
        "lyrics_verification": "verified_true",
        "lyrics_source_kind": lyrics_source_kind,
        "lyrics_char_count": char_count,
        "lyrics_line_count": line_count,
        "lyrics_reason": f"verified_written_lyrics ({lyrics_source_kind}, {line_count} lines, {char_count} chars)",
        "lyrics_snippet": snippet,
    }


def _normalize_hymn_item_dict(
    h: Dict[str, object],
    source_language_id: Optional[int] = None,
    source_category_id: Optional[int] = None,
    source_subcategory_name: Optional[str] = None,
    source_subcategory_id: Optional[int] = None,
) -> Dict[str, object]:
    raw_slug = str(h.get("slug") or "").strip()
    video_id = str(h.get("videoId") or "").strip()
    yt_url = f"https://www.youtube.com/watch?v={video_id}" if video_id else ""
    thumb = (
        str(h.get("thumbnailHigh") or h.get("thumbnailMaxres") or h.get("thumbnailMedium") or "")
        .strip()
    )
    if not thumb and video_id:
        thumb = f"https://i.ytimg.com/vi/{video_id}/hqdefault.jpg"

    channel = h.get("channel") if isinstance(h.get("channel"), dict) else {}
    singers = h.get("singers") if isinstance(h.get("singers"), list) else []
    lyrics_val = h.get("lyrics")
    has_lyrics = bool(
        lyrics_val and str(lyrics_val).strip() and str(lyrics_val).strip() != "$undefined"
    )
    lyrics_snippet = ""
    if has_lyrics and isinstance(lyrics_val, str) and not lyrics_val.startswith("$"):
        stripped = re.sub(r"<[^>]+>", " ", html_mod.unescape(lyrics_val))
        lyrics_snippet = re.sub(r"\s+", " ", stripped).strip()[:250]

    pub_at = str(h.get("publishedAt") or "").replace("$D", "").strip()
    subcats: List[str] = []
    if source_subcategory_name:
        subcats.append(source_subcategory_name)
    cat_ids: List[int] = [source_category_id] if source_category_id is not None else []
    subcat_ids: List[int] = [source_subcategory_id] if source_subcategory_id is not None else []

    return {
        "source_hymn_id": h.get("id"),
        "source_slug": raw_slug,
        "source_url": canonicalize_hymn_url(raw_slug),
        "original_source_title": str(h.get("title") or "").strip(),
        "description": str(h.get("description") or "").strip()
        if h.get("description") and h.get("description") != "$undefined"
        else "",
        "video_id": video_id,
        "youtube_url": yt_url,
        "thumbnail_url": thumb,
        "singer": str(h.get("singer") or "").strip()
        if h.get("singer") and h.get("singer") != "$undefined"
        else "",
        "singers": singers,
        "channel_title": str(channel.get("title") or "").strip(),
        "channel_slug": str(channel.get("slug") or "").strip(),
        "channel_handle": str(channel.get("handle") or "").strip(),
        "clicks_count": int(h.get("clicksCount") or 0),
        "upload_date": pub_at,
        "in_language": "",
        "source_language_id": source_language_id,
        "source_category_ids": cat_ids,
        "source_subcategory_ids": subcat_ids,
        "source_subcategories": subcats,
        "has_source_lyrics": has_lyrics,
        "source_lyrics_snippet": lyrics_snippet,
        "is_detail_verified": False,
        "lyrics_verification": "unverified",
        "lyrics_reason": "",
        "lyrics_source_kind": "",
        "lyrics_char_count": 0,
        "lyrics_line_count": 0,
    }


def parse_hymns_listing_html(
    html_text: str,
    source_language_id: Optional[int] = None,
    source_category_id: Optional[int] = None,
    source_subcategory_name: Optional[str] = None,
    source_subcategory_id: Optional[int] = None,
) -> Dict[str, object]:
    """
    Parse a listing page (/hymns, /hymns?subCategory=..., /hymns/singer/..., /hymns/channels/...).
    Extracts initialHymns, initialTotal, initialTotalPages, and filter taxonomy.
    """
    flight = extract_next_flight_stream(html_text)
    initial_hymns: List[Dict[str, object]] = []
    initial_total = 0
    initial_total_pages = 0
    taxonomy: Dict[str, object] = {
        "categories": [],
        "subCategories": [],
        "languages": [],
        "singers": [],
    }

    for line in flight.splitlines():
        if ":" not in line:
            continue
        _, rest = line.split(":", 1)
        if not (rest.startswith("[") or rest.startswith("{")):
            continue
        try:
            parsed = json.loads(rest)
        except Exception:
            continue

        def _walk(obj: object) -> None:
            nonlocal initial_total, initial_total_pages
            if isinstance(obj, dict):
                if "initialHymns" in obj and isinstance(obj["initialHymns"], list):
                    initial_total = int(obj.get("initialTotal") or len(obj["initialHymns"]))
                    initial_total_pages = int(obj.get("initialTotalPages") or 1)
                    for item in obj["initialHymns"]:
                        if isinstance(item, dict):
                            initial_hymns.append(
                                _normalize_hymn_item_dict(
                                    item,
                                    source_language_id=source_language_id,
                                    source_category_id=source_category_id,
                                    source_subcategory_name=source_subcategory_name,
                                    source_subcategory_id=source_subcategory_id,
                                )
                            )
                if "categories" in obj and "subCategories" in obj and "videoId" not in obj:
                    if obj.get("categories"):
                        taxonomy["categories"] = obj.get("categories") or []
                    if obj.get("subCategories"):
                        taxonomy["subCategories"] = obj.get("subCategories") or []
                    if obj.get("languages"):
                        taxonomy["languages"] = obj.get("languages") or []
                    if obj.get("singers"):
                        taxonomy["singers"] = obj.get("singers") or []
                for v in obj.values():
                    _walk(v)
            elif isinstance(obj, list):
                for elem in obj:
                    _walk(elem)

        _walk(parsed)

    return {
        "initial_hymns": initial_hymns,
        "initial_total": initial_total,
        "initial_total_pages": initial_total_pages,
        "taxonomy": taxonomy,
    }


def parse_hymn_detail_html(
    html_text: str, page_url: str = ""
) -> Tuple[Optional[Dict[str, object]], List[Dict[str, object]]]:
    """
    Parse an individual hymn detail page (/hymns/<slug>).
    Returns (main_hymn_dict, related_hymns_list).
    """
    video_ld: Optional[Dict[str, object]] = None
    og_title = ""
    og_desc = ""
    og_url = ""
    og_image = ""

    if BeautifulSoup is not None:
        soup = BeautifulSoup(html_text, "html.parser")
        for script_tag in soup.find_all("script", attrs={"type": "application/ld+json"}):
            raw_json = script_tag.string or script_tag.get_text() or ""
            try:
                obj = json.loads(raw_json)
                if isinstance(obj, dict) and obj.get("@type") == "VideoObject":
                    video_ld = obj
                    break
            except Exception:
                continue
        meta_title = soup.find("meta", attrs={"property": "og:title"})
        if meta_title and meta_title.get("content"):
            og_title = str(meta_title["content"]).strip()
        meta_desc = soup.find("meta", attrs={"property": "og:description"})
        if meta_desc and meta_desc.get("content"):
            og_desc = str(meta_desc["content"]).strip()
        meta_url = soup.find("meta", attrs={"property": "og:url"})
        if meta_url and meta_url.get("content"):
            og_url = str(meta_url["content"]).strip()
        meta_img = soup.find("meta", attrs={"property": "og:image"})
        if meta_img and meta_img.get("content"):
            og_image = str(meta_img["content"]).strip()
    else:
        for raw_json in re.findall(
            r'<script[^>]*type=["\']application/ld\+json["\'][^>]*>(.*?)</script>',
            html_text,
            re.S,
        ):
            try:
                obj = json.loads(raw_json)
                if isinstance(obj, dict) and obj.get("@type") == "VideoObject":
                    video_ld = obj
                    break
            except Exception:
                continue

    flight = extract_next_flight_stream(html_text)

    # Extract main videoId & slug from Flight
    vid_m = re.search(
        r'\{"videoId":"([^"]+)","slug":"([^"]+)","thumbnailCandidates":', flight
    )
    video_id = vid_m.group(1) if vid_m else ""
    raw_slug = vid_m.group(2) if vid_m else ""

    if not video_id and video_ld and video_ld.get("embedUrl"):
        em_m = re.search(r"/embed/([A-Za-z0-9_-]{11})", str(video_ld.get("embedUrl")))
        if em_m:
            video_id = em_m.group(1)

    if not raw_slug and page_url:
        parsed_u = urlparse(page_url)
        raw_slug = unquote(parsed_u.path.replace("/hymns/", "").strip("/"))

    title = ""
    if video_ld and video_ld.get("name"):
        title = str(video_ld["name"]).strip()
    elif og_title:
        title = re.sub(r"\s*—\s*Mezmur\s*\|\s*መዝሙር.*$", "", og_title).strip()

    # Strictly inspect the ግጥም section (both DOM and Flight)
    lyrics_info = inspect_hymn_lyrics_section(html_text, flight, title=title)
    hymn_id = lyrics_info["hymn_id"]
    has_source_lyrics = bool(lyrics_info["has_lyrics"])
    lyrics_snippet = str(lyrics_info["lyrics_snippet"] or "")

    # Channel link & title
    chan_m = re.search(r'"href":"/hymns/channels/([^"]+)".*?"alt":"([^"]+)"', flight)
    channel_slug = chan_m.group(1) if chan_m else ""
    channel_title = chan_m.group(2).strip() if chan_m else ""

    # Singer links on detail page
    singer_matches = re.findall(
        r'"href":"/hymns/singer/([^"]+)","className":"[^"]+","children":"([^"]+)"', flight
    )
    singers_list: List[Dict[str, object]] = []
    for s_slug, s_name in singer_matches:
        singers_list.append({"slug": s_slug, "name": s_name.strip()})

    if not singers_list and video_ld and isinstance(video_ld.get("byArtist"), list):
        for art in video_ld["byArtist"]:  # type: ignore[index]
            if isinstance(art, dict) and art.get("name"):
                singers_list.append({"slug": "", "name": str(art["name"]).strip()})

    # Clicks count
    clicks_m = re.search(r'"children":\["([\d,]+)"," clicks"\]', flight)
    clicks_count = int(clicks_m.group(1).replace(",", "")) if clicks_m else 0

    description = ""
    if video_ld and video_ld.get("description"):
        description = str(video_ld["description"]).strip()
    elif og_desc:
        description = og_desc

    in_language = str(video_ld.get("inLanguage") or "").strip() if video_ld else ""
    upload_date = str(video_ld.get("uploadDate") or "").strip() if video_ld else ""

    yt_url = f"https://www.youtube.com/watch?v={video_id}" if video_id else ""
    thumb_url = f"https://i.ytimg.com/vi/{video_id}/hqdefault.jpg" if video_id else og_image
    src_url = canonicalize_hymn_url(raw_slug or og_url or page_url)

    main_hymn: Optional[Dict[str, object]] = None
    if title or video_id or raw_slug:
        main_hymn = {
            "source_hymn_id": hymn_id,
            "source_slug": raw_slug,
            "source_url": src_url,
            "original_source_title": title,
            "description": description,
            "video_id": video_id,
            "youtube_url": yt_url,
            "thumbnail_url": thumb_url,
            "singer": str(singers_list[0]["name"]) if singers_list else "",
            "singers": singers_list,
            "channel_title": channel_title,
            "channel_slug": channel_slug,
            "channel_handle": "",
            "clicks_count": clicks_count,
            "upload_date": upload_date,
            "in_language": in_language,
            "source_language_id": None,
            "source_category_ids": [],
            "source_subcategory_ids": [],
            "source_subcategories": [],
            "has_source_lyrics": has_source_lyrics,
            "source_lyrics_snippet": lyrics_snippet,
            "is_detail_verified": True,
            "lyrics_verification": str(lyrics_info["lyrics_verification"]),
            "lyrics_reason": str(lyrics_info["lyrics_reason"]),
            "lyrics_source_kind": str(lyrics_info["lyrics_source_kind"]),
            "lyrics_char_count": int(lyrics_info["lyrics_char_count"]),
            "lyrics_line_count": int(lyrics_info["lyrics_line_count"]),
        }

    # Also extract Related hymns embedded in the Flight stream
    related_hymns: List[Dict[str, object]] = []
    for rel_match in re.finditer(r'\{"hymn":(\{"id":\d+,.*?\}),"userId":', flight):
        try:
            rel_obj = json.loads(rel_match.group(1))
            if isinstance(rel_obj, dict):
                related_hymns.append(_normalize_hymn_item_dict(rel_obj))
        except Exception:
            continue

    return main_hymn, related_hymns
