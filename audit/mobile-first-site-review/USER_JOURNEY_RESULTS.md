# USER JOURNEY RESULTS

| Journey ID | Name | Steps | Status | Notes |
|---|---|---|---|---|
| **JOURNEY A** | First-time mobile visitor | 2 | ✗ FAIL | Failed on step 2: page.click: Timeout 30000ms exceeded.
Call log:
[2m  - waiting for locator('a[href="/bible"]')[22m
[2m    - locator resolved to 3 elements. Proceeding with the first one: <a href="/bible" aria-label="Bible" data-discover="true" class="_modeLink_12myq_400" title="Read the Holy Scriptures">…</a>[22m
[2m  - attempting click action[22m
[2m    2 × waiting for element to be visible, enabled and stable[22m
[2m      - element is not visible[22m
[2m    - retrying click action[22m
[2m    - waiting 20ms[22m
[2m    2 × waiting for element to be visible, enabled and stable[22m
[2m      - element is not visible[22m
[2m    - retrying click action[22m
[2m      - waiting 100ms[22m
[2m    56 × waiting for element to be visible, enabled and stable[22m
[2m       - element is not visible[22m
[2m     - retrying click action[22m
[2m       - waiting 500ms[22m
[2m    - waiting for element to be visible, enabled and stable[22m
 |
| **JOURNEY B** | Hymn Discovery | 3 | ✓ PASS | Successfully navigated Categories -> Kidus Michael (32 Mezmurs) -> Absera Gebriel (Lyrics reader) |
| **JOURNEY C** | Daily Worship | 1 | ✗ FAIL | Failed: page.click: Timeout 30000ms exceeded.
Call log:
[2m  - waiting for locator('a[href="/pray"]')[22m
[2m    - locator resolved to 3 elements. Proceeding with the first one: <a href="/pray" aria-label="Pray" data-discover="true" class="_modeLink_12myq_400" title="Read daily prayers and sacred texts">…</a>[22m
[2m  - attempting click action[22m
[2m    2 × waiting for element to be visible, enabled and stable[22m
[2m      - element is not visible[22m
[2m    - retrying click action[22m
[2m    - waiting 20ms[22m
[2m    2 × waiting for element to be visible, enabled and stable[22m
[2m      - element is not visible[22m
[2m    - retrying click action[22m
[2m      - waiting 100ms[22m
[2m    56 × waiting for element to be visible, enabled and stable[22m
[2m       - element is not visible[22m
[2m     - retrying click action[22m
[2m       - waiting 500ms[22m
 |
| **JOURNEY D** | Calendar Exploration | 1 | ✗ FAIL |  |
| **JOURNEY E** | Bilingual User | 3 | ✗ FAIL | Failed: page.click: Timeout 30000ms exceeded.
Call log:
[2m  - waiting for locator('button[aria-label*="Switch to English" i], button:has-text("EN")')[22m
[2m    - locator resolved to <button lang="en" role="radio" type="button" title="English" aria-checked="false" aria-label="English" class="_seg_avs62_18 ">…</button>[22m
[2m  - attempting click action[22m
[2m    2 × waiting for element to be visible, enabled and stable[22m
[2m      - element is not visible[22m
[2m    - retrying click action[22m
[2m    - waiting 20ms[22m
[2m    2 × waiting for element to be visible, enabled and stable[22m
[2m      - element is not visible[22m
[2m    - retrying click action[22m
[2m      - waiting 100ms[22m
[2m    56 × waiting for element to be visible, enabled and stable[22m
[2m       - element is not visible[22m
[2m     - retrying click action[22m
[2m       - waiting 500ms[22m
 |
| **JOURNEY F** | Search Buddy | 3 | ✗ FAIL | Search completed with 0 interactive result links rendered |
| **JOURNEY G** | Slow mobile connection | 1 | ✓ PASS | About page rendered under 3G network simulation in 3913ms |
| **JOURNEY H** | Admin Auth Boundary | 1 | ✓ PASS | Unauthenticated admin route (/admin/dashboard) redirected to https://tewahedodaily.pages.dev/admin/login with login form enforced |
| **JOURNEY I** | Church Library Admin Inspection | 1 | ✓ PASS | Church Library admin route protected by auth gate (redirected to https://tewahedodaily.pages.dev/admin/login) |
