import sys
from pathlib import Path

import pytest

APP_DIR = Path(__file__).resolve().parents[1] / "app"
if str(APP_DIR) not in sys.path:
    sys.path.insert(0, str(APP_DIR))

import security as sec  # noqa: E402


@pytest.fixture(autouse=True)
def _reset_security_state():
    sec.reset_security_state_for_tests()
    # Ensure debug routes stay off unless a test enables them.
    sec.ENABLE_DEBUG_ROUTES = False
    sec.TRUST_CLOUDFLARE_HEADERS = True
    # Restore default caps (individual tests may lower them temporarily).
    sec.chat_rate_limiter.per_client = sec.CHAT_RATE_LIMIT_PER_MINUTE
    sec.chat_rate_limiter.global_limit = sec.GLOBAL_CHAT_RATE_LIMIT_PER_MINUTE
    sec.chat_rate_limiter.max_tracked = sec.MAX_TRACKED_CLIENTS
    sec.transcribe_rate_limiter.per_client = sec.TRANSCRIBE_RATE_LIMIT_PER_MINUTE
    sec.transcribe_rate_limiter.global_limit = sec.GLOBAL_TRANSCRIBE_RATE_LIMIT_PER_MINUTE
    sec.transcribe_rate_limiter.max_tracked = sec.MAX_TRACKED_CLIENTS
    yield
    sec.reset_security_state_for_tests()
    sec.chat_rate_limiter.per_client = sec.CHAT_RATE_LIMIT_PER_MINUTE
    sec.chat_rate_limiter.global_limit = sec.GLOBAL_CHAT_RATE_LIMIT_PER_MINUTE
    sec.transcribe_rate_limiter.per_client = sec.TRANSCRIBE_RATE_LIMIT_PER_MINUTE
    sec.transcribe_rate_limiter.global_limit = sec.GLOBAL_TRANSCRIBE_RATE_LIMIT_PER_MINUTE
