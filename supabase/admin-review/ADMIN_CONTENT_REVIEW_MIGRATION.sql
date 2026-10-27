-- ============================================================================
-- TEWAHEDODAILY: ADMIN CONTENT REVIEW TAG TRACKING TABLE
-- Migration: 20261026180000_admin_content_review.sql
--
-- CRITICAL RULE:
-- This is strictly an administrative editorial review tracking system.
-- It NEVER affects public content, search visibility, published status,
-- recommendations, or visitor permissions.
--
-- Protected by Row Level Security (RLS) restricting read/write to staff.
-- ============================================================================

BEGIN;

CREATE TABLE IF NOT EXISTS public.admin_content_review (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  content_type TEXT NOT NULL CHECK (content_type IN ('mezmur', 'calendar_card', 'calendar_resource', 'calendar_knowledge')),
  content_id TEXT NOT NULL,
  review_status TEXT NOT NULL DEFAULT 'needs_review' CHECK (review_status IN ('needs_review', 'reviewed')),
  reviewed_by UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  reviewed_by_email TEXT,
  reviewed_at TIMESTAMPTZ,
  review_note TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT admin_content_review_type_id_unique UNIQUE (content_type, content_id)
);

CREATE INDEX IF NOT EXISTS idx_admin_content_review_type_status
  ON public.admin_content_review(content_type, review_status);

CREATE INDEX IF NOT EXISTS idx_admin_content_review_lookup
  ON public.admin_content_review(content_type, content_id);

-- Enable RLS
ALTER TABLE public.admin_content_review ENABLE ROW LEVEL SECURITY;

-- Grants
REVOKE ALL ON public.admin_content_review FROM anon, public;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.admin_content_review TO authenticated;
GRANT ALL ON public.admin_content_review TO service_role;

-- RLS Policy: Only authenticated staff can read and modify reviews
DROP POLICY IF EXISTS admin_content_review_staff_all ON public.admin_content_review;
CREATE POLICY admin_content_review_staff_all ON public.admin_content_review
  FOR ALL TO authenticated
  USING (coalesce(public.is_staff(), false))
  WITH CHECK (coalesce(public.is_staff(), false));

NOTIFY pgrst, 'reload schema';

COMMIT;
