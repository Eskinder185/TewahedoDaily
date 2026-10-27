# TEWAHEDODAILY: COMPREHENSIVE MOBILE-FIRST WEBSITE AUDIT & QUALITY ANALYSIS
**Date:** October 25, 2026  
**Audit Scope:** Public deployment (`https://tewahedodaily.pages.dev`), Local Dev (`http://127.0.0.1:5173`), Supabase backend (`tgvhpibzzkqxkcumrivh`), and FastAPI processing API (`https://ai.eskinder.dev`).  
**Audit Methodology:** Automated Playwright browser tests across 7 viewports (320px to 1440px), network request logging, console exception tracking, touch target measurements, and DOM inspection.

---

## 1. Overall Website Health

TewahedoDaily has established a distinctive, spiritually resonant design with rich Ethiopian Orthodox liturgical content, high typography standards, and thoughtful manuscript aesthetics (parchment/ivory palette, burgundy, gold accents, Ge'ez cross motifs).

The core public discovery features—including the **Bible Reader**, the **Calendar system**, the **Lyrics Reader with synchronized transliteration and liturgical themes**, and the **Hymns Category Browse**—are functioning with high visual polish on modern devices.

However, several critical architectural and mobile usability gaps impair the user experience on smartphones:
1. **Zemaris View Anonymous 401 Permission Error:** On `/practice/categories` and `/practice/occasions`, anonymous requests to `zemaris_with_counts` trigger HTTP 401 (`42501 permission denied for view zemaris_with_counts`), causing unnecessary network noise and falling back to uncounted tables.
2. **Hidden Desktop DOM Elements Intercepting Mobile Clicks:** The desktop header `<a href="/bible">`, `<a href="/pray">`, and segmented language radios remain in the DOM with `display: none` / zero opacity. While normal touch users click the visible mobile hamburger drawer, automated tools and assistive technologies encounter duplicate or invisible target nodes.
3. **Search Buddy Floating Button Collision:** On mobile viewports (390x844), opening the Search modal leaves the underlying floating action button (`_fab_xeogc_1`) in the DOM, partially intercepting clicks near the bottom submit button.
4. **Deployed FastAPI Backend Route Drift:** The production API (`ai.eskinder.dev`) still serves a legacy 21-route build missing all `/api/church-library/*` endpoints. This produces 404 errors whenever Search Buddy attempts Church Library retrieval or staff access the administrative library.

---

## 2. Top Strengths

- **Liturgical Aesthetic & Cultural Integrity:** True Ethiopian Orthodox manuscript design with respectful color hierarchy, clear Ge'ez script typography, and authentic liturgical card presentation.
- **Mezmur Lyrics Experience:** Exceptional lyrics view (`/practice/mezmur/:slug`) offering Amharic, transliteration, split view, font scaling (S/M/L/XL), and manuscript themes (Parchment, Ivory, Gold, Navy, Dark).
- **Calendar & Daily Liturgy:** Rich Ethiopian calendar integration displaying Ge'ez months, saints, daily readings, fasting rules, and feast associations.
- **Bible Reader:** Fast book/chapter navigation across both Old and New Testaments with clean chapter layouts and scripture referencing.
- **Client Performance:** Lightweight Vite bundle with fast DOM paint times (< 1.5s on 4G) and smooth page transitions.

---

## 3. Top Weaknesses

- **Mobile Navigation Reachability:** Important secondary routes (Saints, Feasts, Articles, Submit Mezmur) require 3 to 4 taps inside nested menus or footers.
- **Search Buddy Mobile Keyboard Disruption:** The fixed modal search interface experiences layout crowding when virtual keyboards open on smaller mobile screens (< 380px width).
- **Anonymous Database 401 Noise:** Public views for Zemari counts lack public grant permissions in Supabase, leading to repeated console permission denials.
- **Church Library Backend Unavailability:** Deployed container drift prevents document processing and search excerpt retrieval.

---

## 4. Key Metrics Summary

| Metric | Measured Value |
|---|---|
| **Total Unique Routes Audited** | 21 routes |
| **Interactive Controls Tested** | 276 buttons, links, inputs, and tabs |
| **Viewports Tested** | 7 (320px, 360px, 390px, 430px, 768px, 1024px, 1440px) |
| **User Journeys Completed** | 9 end-to-end flows |
| **Average Mobile Route Load Time** | 1,420 ms (Broadband/4G) |
| **Throttled 3G Load Time** | 3,913 ms |
| **Horizontal Overflow Count** | 0 breaking overflows on standard viewports |
| **Small Touch Targets Identified** | 2 elements on `/submit-mezmur` (< 36px) |
