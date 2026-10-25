"""Conservative Church Library extraction and passage splitting.

The extractors preserve locators that are actually available in the source.
They never OCR, translate, or infer missing text. Scanned PDFs are flagged for
OCR rather than producing invented content.
"""
from __future__ import annotations

import hashlib
import html
import io
import re
import zipfile
from dataclasses import dataclass
from pathlib import PurePosixPath
from typing import Iterable
from xml.etree import ElementTree as ET


SUPPORTED_MIME_TYPES = {
    "application/pdf",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "text/plain",
    "application/epub+zip",
}
MAX_DOCUMENT_BYTES = 50 * 1024 * 1024
MAX_ARCHIVE_ENTRIES = 10_000
MAX_ARCHIVE_EXPANDED_BYTES = 200 * 1024 * 1024


class ExtractionError(ValueError):
    def __init__(self, code: str, message: str):
        super().__init__(message)
        self.code = code


@dataclass(frozen=True)
class ExtractedUnit:
    text: str
    section_title: str | None = None
    chapter_reference: str | None = None
    page_start: int | None = None
    page_end: int | None = None
    confidence: float = 1.0


@dataclass(frozen=True)
class ExtractionResult:
    units: list[ExtractedUnit]
    quality: str
    notes: str | None
    page_count: int | None
    sha256: str


def _clean(value: str) -> str:
    value = value.replace("\x00", " ").replace("\u00ad", "")
    value = re.sub(r"[ \t\r\f\v]+", " ", value)
    value = re.sub(r"\n{3,}", "\n\n", value)
    return value.strip()


def _open_safe_archive(data: bytes, kind: str) -> zipfile.ZipFile:
    try:
        archive = zipfile.ZipFile(io.BytesIO(data))
    except zipfile.BadZipFile as exc:
        raise ExtractionError(f"{kind}_unreadable", f"The {kind.upper()} archive is unreadable.") from exc
    entries = archive.infolist()
    expanded = sum(entry.file_size for entry in entries)
    if len(entries) > MAX_ARCHIVE_ENTRIES or expanded > MAX_ARCHIVE_EXPANDED_BYTES:
        archive.close()
        raise ExtractionError(
            f"{kind}_archive_too_large",
            f"The expanded {kind.upper()} archive exceeds safe processing limits.",
        )
    if any(entry.flag_bits & 0x1 for entry in entries):
        archive.close()
        raise ExtractionError(f"{kind}_encrypted", f"Encrypted {kind.upper()} files are not supported.")
    return archive


def _quality(units: list[ExtractedUnit], *, page_count: int | None = None) -> tuple[str, str | None]:
    joined = "\n".join(u.text for u in units)
    if not joined.strip():
        return "unreadable", "No machine-readable text was found. The file may require OCR."
    replacement_rate = joined.count("\ufffd") / max(1, len(joined))
    if replacement_rate > 0.002:
        return "uncertain", "Extraction contains undecodable characters; verify Ethiopic text against the source."
    if page_count and len(joined) / page_count < 40:
        return "partial", "Very little text was extracted per page; this may be a scanned or partially readable PDF."
    return "good", None


def _extract_pdf(data: bytes) -> tuple[list[ExtractedUnit], int]:
    try:
        from pypdf import PdfReader
    except ImportError as exc:  # pragma: no cover - dependency error is explicit
        raise ExtractionError("pdf_dependency_missing", "PDF extraction requires pypdf on the backend.") from exc
    try:
        reader = PdfReader(io.BytesIO(data), strict=False)
    except Exception as exc:
        raise ExtractionError("pdf_unreadable", "The PDF could not be opened safely.") from exc
    if reader.is_encrypted:
        try:
            if reader.decrypt("") == 0:
                raise ExtractionError("pdf_encrypted", "Encrypted PDFs must be unlocked before upload.")
        except ExtractionError:
            raise
        except Exception as exc:
            raise ExtractionError("pdf_encrypted", "Encrypted PDFs must be unlocked before upload.") from exc
    units: list[ExtractedUnit] = []
    for number, page in enumerate(reader.pages, start=1):
        try:
            text = _clean(page.extract_text() or "")
        except Exception:
            text = ""
        if text:
            units.append(ExtractedUnit(text=text, page_start=number, page_end=number, confidence=0.9))
    return units, len(reader.pages)


def _extract_txt(data: bytes) -> tuple[list[ExtractedUnit], int | None]:
    try:
        decoded = data.decode("utf-8-sig")
    except UnicodeDecodeError as exc:
        raise ExtractionError(
            "text_encoding_unknown",
            "TXT files must use UTF-8 so Amharic and Geʽez characters are preserved.",
        ) from exc
    pages = decoded.split("\f")
    units = [
        ExtractedUnit(text=text, page_start=i if len(pages) > 1 else None, page_end=i if len(pages) > 1 else None)
        for i, raw in enumerate(pages, start=1)
        if (text := _clean(raw))
    ]
    return units, len(pages) if len(pages) > 1 else None


def _extract_docx(data: bytes) -> tuple[list[ExtractedUnit], None]:
    try:
        with _open_safe_archive(data, "docx") as archive:
            root = ET.fromstring(archive.read("word/document.xml"))
    except (KeyError, ET.ParseError) as exc:
        raise ExtractionError("docx_unreadable", "The DOCX document structure is unreadable.") from exc
    ns = {"w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main"}
    units: list[ExtractedUnit] = []
    section: str | None = None
    buffered: list[str] = []

    def flush() -> None:
        if buffered:
            text = _clean("\n".join(buffered))
            if text:
                units.append(ExtractedUnit(text=text, section_title=section, chapter_reference=section))
            buffered.clear()

    for paragraph in root.findall(".//w:body/w:p", ns):
        text = _clean("".join(node.text or "" for node in paragraph.findall(".//w:t", ns)))
        if not text:
            continue
        style = paragraph.find("./w:pPr/w:pStyle", ns)
        style_name = style.get(f"{{{ns['w']}}}val", "") if style is not None else ""
        if style_name.lower().startswith("heading") or style_name.lower().startswith("title"):
            flush()
            section = text
        else:
            buffered.append(text)
    flush()
    return units, None


def _html_text(raw: str) -> tuple[str | None, str]:
    title_match = re.search(r"<(?:h1|h2|title)\b[^>]*>(.*?)</(?:h1|h2|title)>", raw, re.I | re.S)
    title = _clean(re.sub(r"<[^>]+>", " ", html.unescape(title_match.group(1)))) if title_match else None
    without_scripts = re.sub(r"<(script|style)\b.*?</\1>", " ", raw, flags=re.I | re.S)
    text = _clean(re.sub(r"<[^>]+>", "\n", html.unescape(without_scripts)))
    return title, text


def _extract_epub(data: bytes) -> tuple[list[ExtractedUnit], None]:
    with _open_safe_archive(data, "epub") as archive:
        try:
            mimetype = archive.read("mimetype").decode("ascii").strip()
        except (KeyError, UnicodeDecodeError) as exc:
            raise ExtractionError("epub_unreadable", "The EPUB mimetype entry is missing or invalid.") from exc
        if mimetype != "application/epub+zip":
            raise ExtractionError("epub_unreadable", "The EPUB mimetype entry is invalid.")
        names = sorted(
            n for n in archive.namelist()
            if PurePosixPath(n).suffix.lower() in {".xhtml", ".html", ".htm"}
            and not n.lower().startswith("meta-inf/")
        )
        units: list[ExtractedUnit] = []
        for name in names:
            try:
                raw = archive.read(name).decode("utf-8")
            except (UnicodeDecodeError, KeyError):
                continue
            title, text = _html_text(raw)
            if text:
                units.append(
                    ExtractedUnit(
                        text=text,
                        section_title=title,
                        chapter_reference=title or PurePosixPath(name).stem,
                        confidence=0.9,
                    )
                )
    return units, None


def extract_document(data: bytes, mime_type: str) -> ExtractionResult:
    if mime_type not in SUPPORTED_MIME_TYPES:
        raise ExtractionError("unsupported_type", "Only PDF, DOCX, UTF-8 TXT, and EPUB files are supported.")
    if not data:
        raise ExtractionError("empty_file", "The uploaded document is empty.")
    if len(data) > MAX_DOCUMENT_BYTES:
        raise ExtractionError("file_too_large", "Documents are limited to 50 MiB.")
    if mime_type == "application/pdf" and not data.startswith(b"%PDF-"):
        raise ExtractionError("pdf_signature_mismatch", "The uploaded file does not contain a PDF signature.")
    if mime_type in {
        "application/epub+zip",
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    } and not data.startswith((b"PK\x03\x04", b"PK\x05\x06", b"PK\x07\x08")):
        raise ExtractionError("archive_signature_mismatch", "The uploaded DOCX or EPUB is not a ZIP-based document.")
    if mime_type == "application/pdf":
        units, page_count = _extract_pdf(data)
    elif mime_type == "text/plain":
        units, page_count = _extract_txt(data)
    elif mime_type == "application/epub+zip":
        units, page_count = _extract_epub(data)
    else:
        units, page_count = _extract_docx(data)
    quality, notes = _quality(units, page_count=page_count)
    return ExtractionResult(units, quality, notes, page_count, hashlib.sha256(data).hexdigest())


def split_passages(units: Iterable[ExtractedUnit], *, target_chars: int = 1200) -> list[ExtractedUnit]:
    """Split on paragraph/sentence boundaries without crossing source locators."""
    passages: list[ExtractedUnit] = []
    for unit in units:
        blocks = [b.strip() for b in re.split(r"\n\s*\n", unit.text) if b.strip()]
        if not blocks:
            blocks = [unit.text]
        current = ""
        for block in blocks:
            if len(block) > target_chars * 2:
                sentences = [x.strip() for x in re.split(r"(?<=[.!?።፧])\s+", block) if x.strip()]
            else:
                sentences = [block]
            for piece in sentences:
                if current and len(current) + len(piece) + 2 > target_chars:
                    passages.append(ExtractedUnit(current, unit.section_title, unit.chapter_reference, unit.page_start, unit.page_end, unit.confidence))
                    current = ""
                if len(piece) > target_chars * 2:
                    for start in range(0, len(piece), target_chars):
                        chunk = _clean(piece[start:start + target_chars])
                        if chunk:
                            passages.append(ExtractedUnit(chunk, unit.section_title, unit.chapter_reference, unit.page_start, unit.page_end, min(unit.confidence, 0.8)))
                else:
                    current = f"{current}\n\n{piece}".strip()
        if current:
            passages.append(ExtractedUnit(current, unit.section_title, unit.chapter_reference, unit.page_start, unit.page_end, unit.confidence))
    return passages


def detect_language(text: str, fallback: str = "other") -> str:
    letters = [c for c in text if c.isalpha()]
    if not letters:
        return fallback
    ethiopic = sum("\u1200" <= c <= "\u137f" for c in letters)
    ratio = ethiopic / len(letters)
    if ratio > 0.75:
        return "am" if fallback != "gez" else "gez"
    if ratio > 0.15:
        return "mixed"
    return "en" if any("a" <= c.lower() <= "z" for c in letters) else fallback
