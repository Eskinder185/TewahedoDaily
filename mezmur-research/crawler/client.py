"""
Polite HTTP client for eotcmedia.com with robots.txt enforcement,
conservative rate limiting, retries, and exponential backoff.
"""
from __future__ import annotations
import time
from typing import Optional, Tuple
from urllib.parse import urlparse
from urllib.robotparser import RobotFileParser

import requests

USER_AGENT = "TewahedoDailyResearchBot/1.0 (+https://tewahedodaily.pages.dev)"
BASE_URL = "https://eotcmedia.com"


class PoliteCrawlerClient:
    def __init__(
        self,
        user_agent: str = USER_AGENT,
        min_delay_seconds: float = 0.12,
        max_retries: int = 3,
        backoff_base: float = 1.5,
        timeout: int = 20,
    ) -> None:
        self.user_agent = user_agent
        self.min_delay_seconds = min_delay_seconds
        self.max_retries = max_retries
        self.backoff_base = backoff_base
        self.timeout = timeout
        self._last_request_ts: float = 0.0
        self.session = requests.Session()
        self.session.headers.update({
            "User-Agent": self.user_agent,
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            "Accept-Language": "am,en-US;q=0.9,en;q=0.8",
        })
        self.robots: Optional[RobotFileParser] = None
        self.robots_raw: str = ""

    def load_robots_txt(self, base_url: str = BASE_URL) -> Tuple[bool, str]:
        """Fetch and parse robots.txt for the target domain."""
        robots_url = f"{base_url.rstrip('/')}/robots.txt"
        resp = self.session.get(robots_url, timeout=self.timeout)
        resp.raise_for_status()
        self.robots_raw = resp.text
        rp = RobotFileParser()
        rp.set_url(robots_url)
        rp.parse(self.robots_raw.splitlines())
        self.robots = rp
        allowed_hymns = rp.can_fetch(self.user_agent, f"{base_url.rstrip('/')}/hymns")
        return allowed_hymns, self.robots_raw

    def is_allowed(self, url: str) -> bool:
        """Check whether URL is permitted by robots.txt."""
        parsed = urlparse(url)
        # Explicitly enforce Disallow rules from eotcmedia.com/robots.txt
        disallowed_prefixes = (
            "/api/",
            "/admin/",
            "/auth/",
            "/profile",
            "/hymns/collections",
            "/hymns/favorites",
            "/hymns/my-hymns",
            "/hymns/admin/",
            "/hymns/submit",
            "/hymns/play-all",
        )
        for prefix in disallowed_prefixes:
            if parsed.path.startswith(prefix):
                return False
        if self.robots is not None:
            return self.robots.can_fetch(self.user_agent, url)
        return True

    def _respect_rate_limit(self) -> None:
        now = time.time()
        elapsed = now - self._last_request_ts
        if elapsed < self.min_delay_seconds:
            time.sleep(self.min_delay_seconds - elapsed)
        self._last_request_ts = time.time()

    def fetch(self, url: str) -> Tuple[Optional[str], int, Optional[str], int]:
        """
        Fetch a URL with rate limiting, retries, and exponential backoff.
        Returns (response_text, status_code, error_message, retry_count).
        """
        if not self.is_allowed(url):
            return None, 403, f"Blocked by robots.txt policy: {url}", 0

        last_err: Optional[str] = None
        status_code = 0

        for attempt in range(self.max_retries + 1):
            self._respect_rate_limit()
            try:
                resp = self.session.get(url, timeout=self.timeout)
                status_code = resp.status_code
                if status_code == 200:
                    resp.encoding = "utf-8"
                    return resp.text, 200, None, attempt
                if status_code in (401, 403, 404):
                    return None, status_code, f"HTTP {status_code}", attempt
                if status_code == 429 or status_code >= 500:
                    last_err = f"HTTP {status_code}"
                    sleep_s = (self.backoff_base ** attempt) * 1.0
                    time.sleep(sleep_s)
                    continue
                return None, status_code, f"Unexpected HTTP {status_code}", attempt
            except requests.RequestException as exc:
                last_err = f"{type(exc).__name__}: {exc}"
                if attempt < self.max_retries:
                    time.sleep((self.backoff_base ** attempt) * 0.75)

        return None, status_code, last_err or "Max retries exceeded", self.max_retries
