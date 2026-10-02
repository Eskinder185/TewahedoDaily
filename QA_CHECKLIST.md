# Tewahedo Daily — Pre-Deploy QA Checklist

Use before every production deployment. Prefer real phones (or DevTools device mode + throttling) and check **production URL** after deploy, not only localhost.

**Primary widths:** 375 · 390 · 430 (also spot-check 360 · 412)  
**Secondary:** 768 · 1024 · 1280 · 1440  

Mark each item: `[ ]` fail / `[x]` pass · note defects in PR.

---

## Build & tooling

- [ ] `npm run build` succeeds
- [ ] `npm run lint` succeeds (or known waivers documented)
- [ ] `npm run test:calendar-cards` succeeds
- [ ] No new unexpected chunk > ~300 KB gzip without justification
- [ ] Cloudflare SPA routes: hard-refresh `/`, `/calendar`, `/practice`, `/pray`, `/admin/login`

---

## Performance

- [ ] Homepage LCP element is not a multi‑MB PNG
- [ ] Hero image ≤ ~300–500 KB preferred (WebP/JPG), dimensions reserved
- [ ] Calendar card images are WebP/relative content-media paths (not 9–11 MB public PNGs)
- [ ] No full-page blank “Loading...” longer than ~1–2s on Fast 3G for shell+hero
- [ ] Network: no repeated identical Supabase GETs in a tight loop
- [ ] Network: no 404s for legacy tables on happy path (`mezmur_favorites` only if intentionally dual-written)
- [ ] Throttle Fast 3G: Homepage usable; Calendar usable; Hymn detail lyrics first

---

## Mobile navigation

- [ ] 375/390/430: hamburger opens/closes
- [ ] Active route clear
- [ ] No horizontal page overflow
- [ ] Sticky header does not cover primary CTAs
- [ ] Touch targets ≥ ~44px for primary controls (nav, player, carousel, save)

---

## Homepage

- [ ] Hero visible before/without waiting on Calendar/Practice mega-chunks
- [ ] Today in Church: 0 / 1 / 2+ events
- [ ] Multi: arrows+dots; single: no controls
- [ ] Explore Today under date (left column desktop; stacked mobile)
- [ ] Card click opens detail; close works
- [ ] No giant empty left column on desktop
- [ ] Footer breathing room; footer 3-group layout desktop

---

## Hymns / Practice

- [ ] Library search + filters
- [ ] Detail: Amharic / transliteration / Both / English
- [ ] Playback, seek, volume, prev/next
- [ ] Loop 1/2/3 independent; only one active; clear; persists per hymn
- [ ] No Auto Scroll UI
- [ ] Record Yourself: mic only after gesture; deny does not crash
- [ ] Source Video / Support the Zemari links valid
- [ ] Favorite (guest + signed-in): add → reload → remove → reload
- [ ] Console clean of app-owned errors during play

---

## Pray

- [ ] Collections load
- [ ] Open collection → item
- [ ] Liturgy entry points
- [ ] Guest can read without login
- [ ] Mobile stack OK; no overflow on long Amharic

---

## Learn How to Pray

- [ ] Uses `prayer_learning_*` only (no silent legacy tables)
- [ ] Guided Practice 7 steps
- [ ] Learn About Prayer sections
- [ ] Amharic / English / Both
- [ ] Contents nav + accordions
- [ ] Progress persists (localStorage) without breaking

---

## Calendar (public)

- [ ] Timeline fills width with upcoming cards (desktop)
- [ ] Mobile: ~1 card + peek; swipe/arrows
- [ ] Empty days skipped visually
- [ ] Selected vs Today badges correct
- [ ] Card click sets selected date + opens detail
- [ ] Month grid syncs with selection
- [ ] Synaxarium panel matches selected date
- [ ] Language toggle
- [ ] Month/year boundaries
- [ ] Spot-check: Gishen Maryam, Virgin Mary monthly, Gabriel, Meskel, Timket, Abiy Tsom (if present) — title/image/date/summary same event
- [ ] No “featured cards empty” false empty state when published cards exist

---

## Synaxarium

- [ ] Multiple / one / zero commemorations
- [ ] Accordion a11y
- [ ] No raw Supabase error strings in UI

---

## Images & media

- [ ] DB paths relative (`calendar/.../file.webp`) where applicable
- [ ] No blob:/signed-URL stored as canonical path
- [ ] 4:3 calendar art; `object-fit: cover`; `image_position` respected
- [ ] Lazy below fold; hero priority intentional
- [ ] Broken image → lightweight fallback (not 9 MB PNG)

---

## Authentication & favorites

- [ ] Logged out favorites local-only
- [ ] Logged in uses `user_favorites`
- [ ] No spurious 404 storm on `mezmur_favorites` if retired
- [ ] Account / Saved pages load

---

## Admin CMS (staff account)

For each: **save → reload Admin → public page**

### Homepage

- [ ] Slide text/image save persists
- [ ] Public hero updates

### Mezmur

- [ ] Title / lyrics / YouTube URL persist
- [ ] Public Practice reflects change

### Media

- [ ] Upload/select; path stable; preview OK
- [ ] Does not mutate unrelated source_id/slug

### Calendar Cards

- [ ] Dry run Sync summary accurate
- [ ] Apply: repairs links; creates missing; **preserves images/alt/position/homepage flags**
- [ ] Source enrichment visible without regenerating card
- [ ] Public Calendar + Homepage show updates
- [ ] No duplicate cards for same source

### Pray / Learning / Synaxarium (if editable)

- [ ] Publish/status respected publicly
- [ ] Sort order respected

### Users / RLS

- [ ] Non-staff cannot write CMS tables
- [ ] Users cannot edit others’ favorites

---

## Accessibility

- [ ] Keyboard through nav, carousel, player, modals
- [ ] Focus visible
- [ ] Modal Escape + focus return
- [ ] Alt text on content images
- [ ] `prefers-reduced-motion` respected where motion exists

---

## Console / network gate

- [ ] Major routes: zero unexpected ERROR logs
- [ ] No missing-table REST 404 on primary flows
- [ ] Failed images noted and fixed or accepted

---

## Security hygiene

- [ ] No service-role key in frontend env/bundle
- [ ] External links `rel` sane where `target=_blank`
- [ ] CMS HTML not introducing obvious XSS

---

## Sign-off

| Role | Name | Date | Prod URL tested | Result |
|------|------|------|-----------------|--------|
| Eng |  |  |  | PASS / PASS WITH ISSUES / NOT READY |
| Content/CMS |  |  |  | |

**Blockers to list before FORCE deploy:**
1.
2.
3.
