# Hymn content permission and deletion audit

Date: 2026-10-24  
Scope: active imported Mezmur CMS only. No production data was changed.

## Root causes

1. The active Mezmur UI uses `mezmur_data_import` and the import relationship tables, while older canonical tables and policies also remain in the repository. The two models do not provide interchangeable permissions.
2. The Mezmur list issued a direct `DELETE` against `mezmur_data_import`. Current hardened permissions intentionally do not provide a matching safe permanent-delete path, so behavior depended on migration state and could fail under RLS.
3. Zemari deletion was not modeled as a recoverable workflow. An older staff policy was broad enough to permit direct deletion, while the UI had no relationship-aware permanent-delete flow.
4. Sections were directly deleted even though `mezmur_section_links_import` has logical slug relationships rather than database-enforced cascades. This could leave orphan links.
5. There was no shared trash metadata, audit trail, restore operation, or super-admin-only irreversible transaction.

## Effective permission matrix after this change

| Resource / action | Editor | Admin | Super Admin | Enforcement |
|---|---:|---:|---:|---|
| Mezmur create/edit/save draft | Yes | Yes | Yes | Existing staff RLS and save service |
| Mezmur publish/unpublish | Yes | Yes | Yes | Existing guarded publication RPC / draft update |
| Mezmur move to Trash | No | Yes | Yes | `trash_hymn_content` checks `profiles.role` |
| Mezmur restore as Draft | No | Yes | Yes | `restore_hymn_content` checks role |
| Mezmur permanently delete | No | No | Yes | `permanently_delete_hymn_content` checks role and Trash state |
| Zemari create/edit/status | Yes | Yes | Yes | Existing staff RLS |
| Zemari move to Trash / restore | No | Yes | Yes | Protected RPCs |
| Zemari permanent delete | No | No | Yes | Protected RPC; blocked while associated Mezmurs remain |
| Zemari reassign and delete | No | No | Yes | Single transactional RPC |
| Category/occasion association add/remove | Yes | Yes | Yes | Existing staff link-table policies |
| Delete shared category/occasion definition | No new action | No new action | No new action | Import facets are shared/derived; this change deliberately avoids unsafe taxonomy deletion |
| Collection/section create/edit | Yes | Yes | Yes | Existing staff RLS |
| Collection/section move to Trash / restore | No | Yes | Yes | Protected RPCs |
| Collection/section permanent delete | No | No | Yes | Protected RPC; collection deletion is blocked while sections remain |
| Permanent media-object delete | No | Yes | Yes | Existing storage policy; not changed here |

Regular users and anonymous users have no administrative mutation path. Granting RPC execution to `authenticated` is not authorization: every security-definer function resolves `auth.uid()` to `profiles.role` internally before mutating data.

## Relationship handling

- Moving content to Trash changes visibility state and records `deleted_at`, `deleted_by`, and the previous status. Relationships remain intact for restoration.
- Restore always returns content to `draft`; it never silently republishes content.
- Permanent Mezmur deletion removes only that Mezmur's category, occasion, and section link rows, then its import row. It never deletes the Zemari or shared taxonomy.
- Permanent Zemari deletion is rejected while Mezmurs are associated. Super Admin can instead use the reassign-and-delete transaction, which moves every association to an active replacement and deletes only the trashed Zemari.
- Permanent collection deletion is rejected while it still contains sections.
- Permanent section deletion removes only links for that section before deleting the section.
- Public Mezmur visibility remains protected because Trash changes the Mezmur to `draft`, while public reads use the published-only `mezmur_public` projection.
- The legacy favorites tables reference the older canonical `mezmur` model, not `mezmur_data_import`; this migration does not touch them.

## Migration and UI

- Migration: `supabase/migrations/20261024170000_hymn_content_trash_management.sql`
- Read-only verification: `supabase/mezmur-import/VERIFY_HYMN_TRASH_MANAGEMENT_READ_ONLY.sql`
- Central screen: `/admin/hymns/trash`
- Admin/Super Admin receive Move to Trash and Restore actions.
- Only Super Admin receives permanent-delete and Zemari reassignment actions.
- Busy-state disabling makes repeated clicks idempotent at both UI and database levels.
- `content_deletion_events` records actor, actor role, title/key, action, timestamp, previous status, and reassignment details.

## Production application procedure

Do not use `supabase db push` while remote migration history is out of sync.

1. Back up the four active content tables and their link tables.
2. Review the single SQL file `20261024170000_hymn_content_trash_management.sql`.
3. Apply only that file in the Supabase SQL Editor or through the team's reviewed migration runner.
4. Run `VERIFY_HYMN_TRASH_MANAGEMENT_READ_ONLY.sql` as an authenticated staff user.
5. Confirm all four RPCs exist as security-definer functions, anonymous execution is false, authenticated direct DELETE is false, and RLS remains enabled.
6. Deploy the application code only after the SQL verification passes.
7. Smoke-test with separate editor, admin, and super-admin accounts. Do not test irreversible deletion against production content; create a disposable draft fixture first.

## Local validation results

- `npm run test:hymn-trash`: passed.
- `npm run test:mezmur-publication`: passed.
- `npm run test:mezmur-visibility`: passed, including pagination checks.
- `npm run test:mezmur-publication:e2e`: passed in Playwright at desktop and mobile widths.
- Focused ESLint over every changed implementation and test file: passed.
- `npm run build`: passed (TypeScript project build and production Vite bundle).
- Full `npm run lint`: repository baseline still fails with 51 errors and 14 warnings in unrelated existing files, principally React hook/compiler rules in calendar, public-library, prayer, and account components. No focused-lint failure was introduced by this work.
