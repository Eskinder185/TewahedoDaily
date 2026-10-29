#!/usr/bin/env bash
# Usage: scripts/church-library/db-test/run.sh   (needs a local PostgreSQL 15+ with pg_trgm and pgvector)
set -euo pipefail
cd "$(dirname "$0")/../../.."
PSQL=${PSQL:-psql}
DB=${DB:-cl_structured_test}
$PSQL -q -c "drop database if exists $DB" -c "create database $DB" >/dev/null
QUIET="-c client_min_messages=warning"
PGOPTIONS="$QUIET" $PSQL -q -d $DB -v ON_ERROR_STOP=1 -f scripts/church-library/db-test/legacy-stub.sql
PGOPTIONS="$QUIET" $PSQL -q -d $DB -v ON_ERROR_STOP=1 -f supabase/migrations/20261028160000_install_church_library_search_rpc.sql
PGOPTIONS="$QUIET" $PSQL -q -d $DB -v ON_ERROR_STOP=1 -f supabase/migrations/20261029120000_church_library_structured_collections.sql
PGOPTIONS="$QUIET" $PSQL -q -d $DB -v ON_ERROR_STOP=1 -f supabase/migrations/20261029120000_church_library_structured_collections.sql   # idempotent
npx --yes tsx scripts/church-library/db-test/write-payloads.ts
$PSQL -q -d $DB -v ON_ERROR_STOP=1 -f scripts/church-library/db-test/tests.sql 2>&1 | sed -n 's/^.*NOTICE:  //p; /ERROR/p; /ALL CHURCH/p'
