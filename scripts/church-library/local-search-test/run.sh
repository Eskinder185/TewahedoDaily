#!/usr/bin/env bash
# Local-only end-to-end test of the Church Library import + search (no production access).
# Needs: PostgreSQL 16 + pgvector, PostgREST 12 on PATH, node, and @supabase/supabase-js installed in the repo.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
export PGHOST="${PGHOST:-/tmp}" PGPORT="${PGPORT:-5544}" PGUSER="${PGUSER:-postgres}" PGDATABASE=cl
M="$HERE/../../../supabase/migrations"
psql -d postgres -q -c "drop database if exists cl" -c "create database cl"
psql -q -v ON_ERROR_STOP=1 -f "$HERE/00_supabase_stubs.sql"
psql -q -v ON_ERROR_STOP=1 -f "$M/20261024190000_church_library.sql"
psql -q -v ON_ERROR_STOP=1 -f "$M/20261024320000_church_library_passage_editor_revisions.sql"
psql -q -v ON_ERROR_STOP=1 -f "$HERE/05_legacy_bridge.sql"
psql -q -v ON_ERROR_STOP=1 -f "$M/20261026160000_reconcile_church_library_schema.sql"
psql -q -v ON_ERROR_STOP=1 -f "$M/20261027150000_church_library_metadata_and_ingestion_jobs.sql"
psql -q -c "alter role authenticator with login"
postgrest "$HERE/pgrst.conf" > "$HERE/pgrst.log" 2>&1 & PGRST=$!
node "$HERE/proxy.mjs" & PROXY=$!
trap 'kill $PGRST $PROXY 2>/dev/null' EXIT
sleep 2
node "$HERE/e2e.mjs"
