# Calendar Image Workflow — Tewahedo Daily

How to add or change Calendar Card images without touching sources or dates.

## The rule

```
Structured event  →  ONE calendar_cards row  →  ONE image_path  →  Calendar + Homepage
```

Never pick a card by title, date, or “first match.” Always edit by **Card ID**.

---

## Everyday workflow (fewest clicks)

1. Open **Admin → Calendar → Calendar Cards**
2. Click filter chip **Needs Image** (or search: `Gabriel`, `Meskel`, …)
3. On the card row, click **Add Image** / **Change Image**
4. In the modal:
   - Choose an existing image **or** upload (auto WebP)
   - Set position / alt if needed
5. Click **Save Image**
6. Wait for confirmation that includes:
   - Event name  
   - **Card ID**  
   - Persisted **Image path**  
7. Optional: **Save & Next Missing** to keep going through the queue

That’s it. You do **not** re-select the source, edit dates, or open the full editor.

**Typical click count:** open list → filter → Add Image → pick/upload → Save → **~4–5 clicks**.

---

## What “Save Image” does

1. `UPDATE calendar_cards SET image_path, image_alt, image_position WHERE id = <exact uuid>`
2. Refetch that same row from Supabase
3. Fail if stored `image_path` ≠ requested path (no false success)
4. Invalidate the public 30s card cache

Local MediaPicker preview alone is **not** considered saved.

---

## Publishing (critical)

Public Calendar and Homepage only load **`status = published`** cards.

If Admin shows HAS IMAGE but the public site still says Needs Image:

1. Check the badge **DRAFT · NOT PUBLIC** (or status filter **Draft**)
2. Open **Edit details** → set status to **published** → Save  
   (Image-only modal does not change status.)

---

## Full editor vs image-only

| Mode | Use for |
| --- | --- |
| **Add/Change Image** (modal) | Routine art updates |
| **Edit details** | Homepage flags, educational overrides, featured |
| **Advanced → Relink Source** | Rare; requires confirmation; never part of image work |

---

## Sync Calendar Cards

**Dry run → Apply safe fixes**

- Creates missing linked placeholders  
- Repairs id/slug mismatches  
- Merges duplicates (keeps presentation on the survivor)  
- **Never clears** `image_path` / alt / position  
- Idempotent: second run should create **0** new duplicates  

After Sync, publish cards that should be public, then attach images via Needs Image.

---

## Image specs

| Spec | Recommendation |
| --- | --- |
| Aspect | **4:3** |
| Format | **WebP** (MediaPicker converts when enabled) |
| Size | ~**1200×900**, optimized for web |
| Storage | `content-media` bucket |
| Path | `calendar/<category>/<subject>-<unique>.webp` |
| Replace policy | New unique filename (avoid CDN cache sticking to old bytes) |

Do not upload multi‑MB PNG masters for ordinary cards.

---

## Verification checklist (per card)

After save:

- [ ] Admin list thumb updates (same Card ID)  
- [ ] Confirmation shows matching path  
- [ ] Card is **published**  
- [ ] Calendar occurrence shows the new image  
- [ ] If the feast is today, Homepage Today uses the **same Card ID / path**  
- [ ] A different event (e.g. Demera vs Bisrate) did not pick up this art  

---

## Bisrate Gabriel / Demera

Search by title or `source_slug`. Confirm a **single** non-archived card per source.  
Edit that Card ID only. After Sync, duplicates should be archived into one canonical row.
