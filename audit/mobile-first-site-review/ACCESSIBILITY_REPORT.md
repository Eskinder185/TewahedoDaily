# ACCESSIBILITY (a11y) AUDIT REPORT (WCAG 2.2 AA)

## 1. Compliance Summary

| Category | Status | Notes |
|---|:---:|---|
| **Landmark Structure** | **PASS** | `<header>`, `<main>`, `<footer>`, `<nav>` elements appropriately declared. |
| **Skip Links** | **PASS** | "Skip to main content" link present and focused on first Tab keypress. |
| **Page Titles** | **PASS** | Unique, descriptive `<title>` tags updated on every route navigation. |
| **Color Contrast** | **PASS** | Deep burgundy and dark navy on parchment surfaces exceed 7:1 ratio (AAA). |
| **Semantic Headings** | **PASS** | `<h1>` through `<h3>` hierarchy maintained across all audited routes. |
| **Touch Targets** | **WARN** | A few small inline link/checkbox targets (< 36px) on `/submit-mezmur`. |
| **Dialog Focus Trapping** | **WARN** | Search modal traps focus but underlying FAB button remains in click path. |
| **Screen Reader Labels** | **PASS** | Icon buttons include explicit `aria-label` tags (`Open menu`, `Open search`, `Next day`). |

---

## 2. Detailed Findings & Recommendations

### 2.1 Hidden Duplicate Nav Elements
- **Location:** Header navigation in `src/components/layout/Header.tsx`
- **Issue:** On mobile viewports, the desktop navigation container (`_modeLink_*`) is hidden via CSS `display: none` or opacity. Assistive tech or automated locators that do not filter by visibility find multiple `a[href="/bible"]` and `a[href="/pray"]` links.
- **Fix:** Ensure mobile vs desktop navigation trees use conditional React rendering (`isMobile` media query check) or explicit `aria-hidden="true"` on the inactive desktop markup.

### 2.2 Keyboard Navigation & Focus Ring Visibility
- Focus rings (`outline: 2px solid var(--accent-gold)`) are visible across all interactive buttons, links, and form inputs.
- The lyrics toolbar in `/practice/mezmur/:slug` supports full keyboard navigation between S/M/L/XL font sizes and manuscript themes.

### 2.3 Reduced Motion Support (`prefers-reduced-motion`)
- CSS transitions for drawer sliding and lyrics auto-scroll respect `@media (prefers-reduced-motion: reduce)`.
