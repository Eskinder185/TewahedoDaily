import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://approval-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_approval_test'

const server = await createServer({ server: { host: '127.0.0.1', port: 4181, strictPort: true } })
await server.listen()

let browser
try {
  browser = await chromium.launch()
  const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } })
  const pageErrors = []
  page.on('pageerror', (error) => pageErrors.push(error.message))

  const user = {
    id: '11111111-1111-1111-1111-111111111111',
    email: 'super-admin@example.invalid',
    aud: 'authenticated',
    role: 'authenticated',
    app_metadata: {},
    user_metadata: {},
    created_at: new Date().toISOString(),
  }
  const token = [
    Buffer.from('{"alg":"HS256","typ":"JWT"}').toString('base64url'),
    Buffer.from(JSON.stringify({ sub: user.id, exp: Math.floor(Date.now() / 1000) + 3600, role: 'authenticated' })).toString('base64url'),
    'mock',
  ].join('.')
  let profileRole = 'super_admin'
  let forcePermissionError = false
  let clock = Date.now()
  const now = () => new Date(++clock).toISOString()

  const zemaris = [
    {
      id: 'aaaaaaaa-0000-0000-0000-000000000010',
      slug: 'zemari-tewodros-yosef',
      name: 'Zemari Tewodros Yosef',
      name_amharic: 'ዘማሪ ቴዎድሮስ ዮሴፍ',
      status: 'published',
      sort_order: 10,
      is_featured: false,
      created_at: now(),
      updated_at: now(),
    },
  ]

  const sections = [
    {
      import_id: 'dddddddd-0000-0000-0000-000000000001',
      id: 'sec-1',
      section_id: 'sec-1',
      collection_id: 'col-1',
      collection_slug: 'major-feasts',
      slug: 'timkat',
      section_slug: 'timkat',
      title: 'Timkat (Epiphany)',
      sort_order: 10,
      status: 'published',
    },
  ]

  const mezmurMap = new Map()
  mezmurMap.set('existing-draft', {
    import_id: 'bbbbbbbb-0000-0000-0000-000000000001',
    mezmur_id: 'existing-draft',
    slug: 'existing-draft',
    title: 'Existing Draft Hymn',
    title_amharic: 'የነበረ ረቂቅ መዝሙር',
    title_english: null,
    description: 'An existing draft record with relationships intact.',
    description_amharic: null,
    lyrics_amharic: 'ይህ የሙከራ መዝሙር ግጥም ነው።',
    lyrics_transliteration: 'Yih yemukera mezmur gitim new.',
    lyrics_english: 'This is test hymn text.',
    lyrics_geez: null,
    lyrics_oromo: null,
    primary_language: 'amharic',
    form: 'mezmur',
    singer_id: zemaris[0].id,
    singer_slug: zemaris[0].slug,
    singer_name: zemaris[0].name,
    zemari_id: zemaris[0].id,
    youtube_url: 'https://www.youtube.com/watch?v=abcdefghijk',
    audio_url: null,
    image_path: null,
    image_alt: null,
    legacy_thumbnail_url: null,
    search_keywords: [],
    status: 'draft',
    review_status: 'needs_review',
    review_notes: null,
    source_url: 'https://example.invalid/source-record',
    source_notes: 'Historical import source.',
    rights_status: 'owned',
    publication_approved_at: now(),
    publication_approved_by: user.id,
    deleted_at: null,
    deleted_by: null,
    deleted_from_status: null,
    created_at: now(),
    updated_at: now(),
  })
  mezmurMap.set('media-only-draft', {
    ...mezmurMap.get('existing-draft'),
    import_id: 'bbbbbbbb-0000-0000-0000-000000000002',
    mezmur_id: 'media-only-draft',
    slug: 'media-only-draft',
    title: 'Media Only Hymn',
    title_amharic: 'የቪዲዮ መዝሙር',
    lyrics_amharic: 'ይህ ግጥም በሕዝብ ገጽ ላይ መታየት የለበትም።',
    rights_status: 'unknown',
    publication_approved_at: null,
    publication_approved_by: null,
    source_url: 'https://example.invalid/media-only-source',
    status: 'draft',
    updated_at: now(),
  })

  const categoryLinks = new Map([['existing-draft', ['virgin-mary']]])
  const occasionLinks = new Map([['existing-draft', ['timkat']]])
  const sectionLinks = new Map([['existing-draft', ['sec-1']]])

  const calls = []
  const ordinaryPayloads = []

  await page.route('https://approval-test.supabase.co/**', async (route) => {
    const request = route.request()
    const url = new URL(request.url())
    let body = []
    let status = 200

    if (url.pathname === '/auth/v1/token') {
      body = { access_token: token, refresh_token: 'test-refresh', expires_in: 3600, token_type: 'bearer', user }
    } else if (url.pathname === '/auth/v1/user') {
      body = user
    } else if (url.pathname === '/rest/v1/profiles') {
      body = { id: user.id, email: user.email, display_name: 'CMS Test User', role: profileRole }
    } else if (url.pathname === '/rest/v1/rpc/is_staff') {
      body = ['editor', 'admin', 'super_admin'].includes(profileRole)
    } else if (url.pathname === '/rest/v1/rpc/cms_version_authors') {
      body = []
    } else if (url.pathname === '/rest/v1/rpc/trash_hymn_content') {
      const payload = request.postDataJSON()
      if (!['admin', 'super_admin'].includes(profileRole)) {
        status = 403
        body = { code: '42501', message: 'An admin or super admin role is required to move content to Trash' }
      } else {
        const target = [...mezmurMap.values()].find((row) => row.import_id === payload.p_content_key)
        assert.ok(target)
        if (!target.deleted_at) {
          target.deleted_from_status = target.status
          target.deleted_at = now()
          target.deleted_by = user.id
          target.status = 'draft'
        }
        body = { action: 'trashed', changed: true }
      }
    } else if (url.pathname === '/rest/v1/rpc/restore_hymn_content') {
      const payload = request.postDataJSON()
      if (!['admin', 'super_admin'].includes(profileRole)) {
        status = 403
        body = { code: '42501', message: 'An admin or super admin role is required to restore content' }
      } else {
        const target = [...mezmurMap.values()].find((row) => row.import_id === payload.p_content_key)
        assert.ok(target?.deleted_at)
        target.deleted_at = null
        target.deleted_by = null
        target.deleted_from_status = null
        target.status = 'draft'
        body = { action: 'restored', status: 'draft' }
      }
    } else if (url.pathname === '/rest/v1/rpc/permanently_delete_hymn_content') {
      const payload = request.postDataJSON()
      const target = [...mezmurMap.values()].find((row) => row.import_id === payload.p_content_key)
      if (profileRole !== 'super_admin') {
        status = 403
        body = { code: '42501', message: 'Only a super admin can permanently delete content' }
      } else if (!target?.deleted_at) {
        status = 409
        body = { code: '23514', message: 'Move this Mezmur to Trash before permanently deleting it' }
      } else {
        mezmurMap.delete(target.mezmur_id)
        categoryLinks.delete(target.slug)
        occasionLinks.delete(target.slug)
        sectionLinks.delete(target.slug)
        body = { action: 'permanently_deleted' }
      }
    } else if (url.pathname === '/rest/v1/rpc/publish_mezmur_import') {
      calls.push('publish')
      const authorization = request.headers().authorization || ''
      if (
        authorization !== `Bearer ${token}` ||
        forcePermissionError ||
        !['editor', 'admin', 'super_admin'].includes(profileRole)
      ) {
        status = 403
        body = { code: '42501', message: 'An editor, admin, or super admin role is required' }
      } else {
        const payload = request.postDataJSON()
        const target = [...mezmurMap.values()].find((m) => m.slug === payload.p_slug)
        assert.ok(target, `Expected mezmur for slug ${payload.p_slug}`)
        assert.ok(target.title?.trim() && target.slug?.trim() && target.lyrics_amharic?.trim())
        assert.equal('p_rights_status' in payload, false, 'Normal Publish must not mutate protected rights metadata')
        const lyricsAllowed =
          ['owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only'].includes(target.rights_status) &&
          target.publication_approved_at && target.publication_approved_by
        const hasExternalDestination = target.youtube_url || target.source_url
        assert.ok(lyricsAllowed || hasExternalDestination, 'Publish requires displayable lyrics or an external destination')
        const updated = {
          ...target,
          status: 'published',
          updated_at: now(),
        }
        mezmurMap.set(updated.mezmur_id, updated)
        body = { slug: updated.slug, status: 'published' }
      }
    } else if (url.pathname === '/rest/v1/mezmur_data_import') {
      if (forcePermissionError && (request.method() === 'POST' || request.method() === 'PATCH')) {
        status = 403
        body = {
          code: '42501',
          message: 'new row violates row-level security policy for table "mezmur_data_import"',
          details: 'Staff role required for write access.',
        }
      } else if (request.method() === 'POST') {
        const payload = request.postDataJSON()
        ordinaryPayloads.push(payload)
        const created = {
          ...payload,
          mezmur_id: payload.mezmur_id || crypto.randomUUID(),
          rights_status: 'unknown',
          review_status: null,
          publication_approved_at: null,
          publication_approved_by: null,
          created_at: payload.created_at || now(),
          updated_at: payload.updated_at || now(),
        }
        mezmurMap.set(created.mezmur_id, created)
        body = [created]
      } else if (request.method() === 'PATCH') {
        const payload = request.postDataJSON()
        ordinaryPayloads.push(payload)
        const idFilter = url.searchParams.get('mezmur_id')?.replace(/^eq\./, '')
        const slugFilter = url.searchParams.get('slug')?.replace(/^eq\./, '')
        const existing =
          (idFilter && mezmurMap.get(idFilter)) ||
          [...mezmurMap.values()].find((m) => m.slug === slugFilter)
        assert.ok(existing, 'Expected existing row on PATCH')
        // Direct status transition to published must never happen via ordinary PATCH
        if (payload.status === 'published' && existing.status !== 'published') {
          status = 403
          body = { code: '42501', message: 'Use publish_mezmur_import for publication transitions' }
        } else {
          const updated = { ...existing, ...payload, updated_at: payload.updated_at || now() }
          mezmurMap.set(updated.mezmur_id, updated)
          body = [updated]
        }
      } else {
        const idFilter = url.searchParams.get('mezmur_id')?.replace(/^eq\./, '')
        const slugFilter = url.searchParams.get('slug')?.replace(/^eq\./, '')
        const statusFilter = url.searchParams.get('status')?.replace(/^eq\./, '')
        let rows = [...mezmurMap.values()]
        if (idFilter) rows = rows.filter((r) => r.mezmur_id === idFilter)
        if (slugFilter) rows = rows.filter((r) => r.slug === slugFilter)
        if (statusFilter) rows = rows.filter((r) => r.status === statusFilter)
        if (url.searchParams.get('deleted_at') === 'is.null') rows = rows.filter((r) => !r.deleted_at)
        if (url.searchParams.get('deleted_at') === 'not.is.null') rows = rows.filter((r) => r.deleted_at)
        body = rows
      }
    } else if (url.pathname === '/rest/v1/mezmur_public') {
      // Public projection redacts lyrics for media/source-only published rows.
      const slugFilter = url.searchParams.get('slug')?.replace(/^eq\./, '')
      let rows = [...mezmurMap.values()].filter(
        (r) =>
          r.status === 'published' &&
          r.title?.trim() &&
          r.slug?.trim() &&
          r.lyrics_amharic?.trim() &&
          ((['owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only'].includes(r.rights_status) &&
            r.publication_approved_at && r.publication_approved_by) ||
            r.youtube_url || r.source_url),
      )
      rows = rows.map((r) => {
        const lyricsAllowed =
          ['owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only'].includes(r.rights_status) &&
          r.publication_approved_at && r.publication_approved_by
        return lyricsAllowed
          ? r
          : {
              ...r,
              lyrics_amharic: null,
              lyrics_transliteration: null,
              lyrics_english: null,
              lyrics_geez: null,
              lyrics_oromo: null,
            }
      })
      if (slugFilter) rows = rows.filter((r) => r.slug === slugFilter)
      body = rows
    } else if (
      url.pathname === '/rest/v1/zemaris_with_counts' &&
      /deleted_(?:at|by|from_status)/.test(url.searchParams.get('select') || '')
    ) {
      // Reproduce production while the base table has all Trash columns but
      // the derived counts view still exposes its pre-Trash column contract.
      status = 400
      body = {
        code: '42703',
        message: 'column zemaris_with_counts.deleted_from_status does not exist',
      }
    } else if (url.pathname === '/rest/v1/zemaris' || url.pathname === '/rest/v1/zemaris_with_counts') {
      const deletedFilter = url.searchParams.get('deleted_at')
      body = zemaris
        .filter((row) => deletedFilter === 'not.is.null' ? row.deleted_at : deletedFilter === 'is.null' ? !row.deleted_at : true)
        .map((row) => ({ ...row, mezmur_count: [...mezmurMap.values()].filter((m) => m.zemari_id === row.id && !m.deleted_at).length }))
    } else if (url.pathname === '/rest/v1/mezmur_collections_import') {
      body = []
    } else if (url.pathname === '/rest/v1/mezmur_sections_import') {
      body = url.searchParams.get('deleted_at') === 'not.is.null' ? [] : sections
    } else if (url.pathname === '/rest/v1/mezmur_category_links_import') {
      if (request.method() === 'POST') {
        const posted = Array.isArray(request.postDataJSON()) ? request.postDataJSON() : [request.postDataJSON()]
        if (posted.length) {
          categoryLinks.set(
            posted[0].mezmur_slug,
            posted.map((p) => p.category_slug),
          )
        }
        body = posted
      } else if (request.method() === 'DELETE') {
        body = []
      } else {
        const mezmurSlug = url.searchParams.get('mezmur_slug')?.replace(/^eq\./, '')
        if (mezmurSlug) {
          body = (categoryLinks.get(mezmurSlug) || []).map((category_slug) => ({
            mezmur_slug: mezmurSlug,
            category_slug,
          }))
        } else {
          body = [{ category_slug: 'virgin-mary' }, { category_slug: 'cross' }]
        }
      }
    } else if (url.pathname === '/rest/v1/mezmur_occasion_links_import') {
      if (request.method() === 'POST') {
        const posted = Array.isArray(request.postDataJSON()) ? request.postDataJSON() : [request.postDataJSON()]
        if (posted.length) {
          occasionLinks.set(
            posted[0].mezmur_slug,
            posted.map((p) => p.occasion_slug),
          )
        }
        body = posted
      } else if (request.method() === 'DELETE') {
        body = []
      } else {
        const mezmurSlug = url.searchParams.get('mezmur_slug')?.replace(/^eq\./, '')
        if (mezmurSlug) {
          body = (occasionLinks.get(mezmurSlug) || []).map((occasion_slug) => ({
            mezmur_slug: mezmurSlug,
            occasion_slug,
          }))
        } else {
          body = [{ occasion_slug: 'timkat' }]
        }
      }
    } else if (url.pathname === '/rest/v1/mezmur_section_links_import') {
      if (request.method() === 'POST') {
        const posted = Array.isArray(request.postDataJSON()) ? request.postDataJSON() : [request.postDataJSON()]
        if (posted.length) {
          const mSlug = posted[0].mezmur_slug
          sectionLinks.set(
            mSlug,
            posted.map((p) => p.section_id || p.section_slug),
          )
        }
        body = posted
      } else if (request.method() === 'DELETE') {
        body = []
      } else {
        const mezmurSlug = url.searchParams.get('mezmur_slug')?.replace(/^eq\./, '')
        const mezmurId = url.searchParams.get('mezmur_id')?.replace(/^eq\./, '')
        const key = mezmurSlug || mezmurId || 'existing-draft'
        body = (sectionLinks.get(key) || []).map((secId, idx) => ({
          id: `link-${idx}`,
          mezmur_id: key,
          mezmur_slug: key,
          section_id: secId,
          section_slug: 'timkat',
          sort_order: idx * 10,
        }))
      }
    } else {
      body = []
    }

    await route.fulfill({
      status,
      contentType: 'application/json',
      headers: {
        'access-control-expose-headers': 'content-range',
        'content-range': Array.isArray(body) ? `0-${Math.max(0, body.length - 1)}/${body.length}` : '0-0/1',
      },
      body: JSON.stringify(body),
    })
  })

  const base = 'http://127.0.0.1:4181'
  await page.goto(`${base}/admin/login`)
  await page.getByLabel('Email', { exact: true }).fill(user.email)
  await page.getByLabel('Password', { exact: true }).fill('test-password')
  await page.getByRole('button', { name: 'Sign in', exact: true }).click()
  await page.getByRole('heading', { name: 'Dashboard', exact: true }).waitFor()

  // Scenario 8 (pre-check): Draft records do not appear on public pages
  await page.goto(`${base}/practice/mezmur/existing-draft`)
  await page.getByRole('heading', { name: /not found|unavailable/i }).waitFor()

  // Scenario 1 & 6: Authorized staff can create a draft, and publication requires title, slug, and Amharic lyrics
  await page.goto(`${base}/admin/hymns/mezmur/new`)
  await page.getByRole('heading', { name: 'Add Mezmur', exact: true }).waitFor()
  await page.getByText('CMS role: super_admin · Status: Draft', { exact: true }).waitFor()

  // Scenario 9: Normal editor contains no editorial approval panel
  assert.equal(await page.getByRole('heading', { name: /Editorial approval/i }).count(), 0)
  assert.equal(await page.getByRole('button', { name: /Approve Mezmur/i }).count(), 0)
  assert.equal(await page.getByLabel(/Verified publication-rights status/i).count(), 0)
  assert.equal(await page.getByText(/Editorial review:/i).count(), 0)

  // Scenario 6: Try to publish without required fields -> blocked with clear validation error
  await page.getByLabel('Transliteration title *', { exact: true }).fill('New Hymn Draft')
  await page.getByRole('button', { name: 'Generate from title', exact: true }).click()
  await page.getByRole('button', { name: 'Publish', exact: true }).click()
  await page.getByRole('alert').filter({ hasText: 'Amharic lyrics are required to publish.' }).first().waitFor()

  // Scenario 1: Save Draft succeeds even without Amharic lyrics
  await page.getByRole('button', { name: 'Save Draft', exact: true }).click()
  await page.getByRole('heading', { name: 'Edit Mezmur', exact: true }).waitFor()
  assert.equal(mezmurMap.get([...mezmurMap.keys()].at(-1)).status, 'draft')

  // Scenario 2 & 7: Open existing draft with category, occasion, and Zemari relationships intact, edit it, and save draft
  await page.goto(`${base}/admin/hymns/mezmur/existing-draft/edit`)
  await page.getByRole('heading', { name: 'Edit Mezmur', exact: true }).waitFor()
  await page.getByText('CMS role: super_admin · Status: Draft', { exact: true }).waitFor()
  assert.equal(await page.getByLabel('Zemari', { exact: true }).inputValue(), zemaris[0].id)
  await page.getByText('Virgin Mary').first().waitFor()
  await page.getByText(/Timkat/i).first().waitFor()

  await page.getByLabel('Description').first().fill('Updated draft description while preserving relationships.')
  await page.getByRole('button', { name: 'Save Draft', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Mezmur saved as draft.' }).waitFor()
  assert.equal(mezmurMap.get('existing-draft').description, 'Updated draft description while preserving relationships.')
  assert.equal(mezmurMap.get('existing-draft').zemari_id, zemaris[0].id)
  assert.deepEqual(categoryLinks.get('existing-draft'), ['virgin-mary'])
  assert.deepEqual(occasionLinks.get('existing-draft'), ['timkat'])

  // Ensure ordinary save never sends protected fields
  for (const payload of ordinaryPayloads) {
    for (const protectedField of ['review_status', 'rights_status', 'publication_approved_at', 'publication_approved_by']) {
      assert.equal(protectedField in payload, false, `${protectedField} leaked into ordinary save`)
    }
  }

  // Scenario 10: Permission errors display understandable explanations
  forcePermissionError = true
  await page.getByRole('button', { name: 'Publish', exact: true }).click()
  await page
    .getByRole('alert')
    .filter({ hasText: /You do not have permission|Permission denied/i })
    .waitFor()
  forcePermissionError = false

  // Scenario 3: Authorized staff can publish eligible content directly without an approval step
  await page.getByRole('button', { name: 'Publish', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Mezmur published successfully.' }).waitFor()
  await page.getByText('CMS role: super_admin · Status: Published', { exact: true }).waitFor()
  assert.equal(mezmurMap.get('existing-draft').status, 'published')
  assert.equal(mezmurMap.get('existing-draft').rights_status, 'owned')
  assert.equal(mezmurMap.get('existing-draft').publication_approved_by, user.id)
  assert.ok(calls.includes('publish'))

  // Scenario 4: Authorized staff can return published content to draft
  await page.getByRole('button', { name: 'Return to Draft', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Mezmur saved as draft.' }).waitFor()
  await page.getByText('CMS role: super_admin · Status: Draft', { exact: true }).waitFor()
  assert.equal(mezmurMap.get('existing-draft').status, 'draft')

  // Scenario 3 (editor role): Editor role is displayed accurately and can also publish
  profileRole = 'editor'
  await page.reload()
  await page.getByRole('heading', { name: 'Edit Mezmur', exact: true }).waitFor()
  await page.getByText('CMS role: editor · Status: Draft', { exact: true }).waitFor()
  await page.getByRole('button', { name: 'Publish', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Mezmur published successfully.' }).waitFor()
  await page.getByText('CMS role: editor · Status: Published', { exact: true }).waitFor()

  // Media-only publication: unresolved lyrics remain private while the YouTube/source record is public.
  await page.goto(`${base}/admin/hymns/mezmur/media-only-draft/edit`)
  await page.getByRole('heading', { name: 'Edit Mezmur', exact: true }).waitFor()
  await page.getByRole('button', { name: 'Publish', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Mezmur published successfully.' }).waitFor()
  assert.equal(mezmurMap.get('media-only-draft').status, 'published')
  assert.equal(mezmurMap.get('media-only-draft').rights_status, 'unknown')
  await page.goto(`${base}/practice/mezmur/media-only-draft`)
  await page.getByText('The lyrics are not republished on TewahedoDaily. Listen with the video or open the authorized source.').waitFor()
  assert.equal(await page.getByText('ይህ ግጥም በሕዝብ ገጽ ላይ መታየት የለበትም።', { exact: true }).count(), 0)

  // Mobile regression: media-only public detail and simple editor actions fit the viewport.
  await page.setViewportSize({ width: 390, height: 844 })
  await page.reload()
  await page.getByText('The lyrics are not republished on TewahedoDaily. Listen with the video or open the authorized source.').waitFor()
  assert.equal(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), true)
  await page.goto(`${base}/admin/hymns/mezmur/media-only-draft/edit`)
  await page.getByRole('heading', { name: 'Edit Mezmur', exact: true }).waitFor()
  await page.getByRole('button', { name: 'Return to Draft', exact: true }).waitFor()
  await page.getByRole('button', { name: 'Publish', exact: true }).waitFor()
  assert.equal(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), true)
  await page.setViewportSize({ width: 1440, height: 1000 })

  // Trash workflow: Super Admin can trash, Admin can restore as Draft, and only Super Admin can delete permanently.
  profileRole = 'super_admin'
  page.on('dialog', (dialog) => dialog.accept())
  await page.goto(`${base}/admin/hymns/mezmur`)
  await page.getByRole('heading', { name: 'Mezmur', exact: true }).waitFor()
  const existingRow = page.getByRole('row').filter({ hasText: 'Existing Draft Hymn' })
  await existingRow.getByRole('button', { name: 'Move to Trash', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Mezmur moved to Trash.' }).waitFor()
  assert.ok(mezmurMap.get('existing-draft').deleted_at)
  assert.equal(mezmurMap.get('existing-draft').status, 'draft')
  assert.equal(zemaris.length, 1, 'trashing a Mezmur must not delete its Zemari')

  await page.goto(`${base}/admin/hymns/trash`)
  await page.getByRole('heading', { name: 'Trash', exact: true }).waitFor()
  await page.getByText('Existing Draft Hymn', { exact: true }).waitFor()
  await page.getByRole('button', { name: 'Restore as Draft', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'restored as a draft' }).waitFor()
  assert.equal(mezmurMap.get('existing-draft').deleted_at, null)
  assert.equal(mezmurMap.get('existing-draft').status, 'draft')

  await page.goto(`${base}/admin/hymns/mezmur`)
  await page.getByRole('row').filter({ hasText: 'Existing Draft Hymn' }).getByRole('button', { name: 'Move to Trash', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'Mezmur moved to Trash.' }).waitFor()
  await page.goto(`${base}/admin/hymns/trash`)
  await page.getByText('Existing Draft Hymn', { exact: true }).waitFor()

  profileRole = 'editor'
  await page.reload()
  await page.getByRole('heading', { name: 'Trash', exact: true }).waitFor()
  assert.equal(await page.getByRole('button', { name: 'Delete Permanently', exact: true }).count(), 0)

  profileRole = 'super_admin'
  await page.reload()
  await page.getByRole('button', { name: 'Delete Permanently', exact: true }).click()
  await page.getByRole('status').filter({ hasText: 'permanently deleted' }).waitFor()
  assert.equal(mezmurMap.has('existing-draft'), false)
  assert.equal(zemaris.length, 1, 'permanent Mezmur deletion must preserve its Zemari')

  await page.setViewportSize({ width: 390, height: 844 })
  await page.reload()
  await page.getByRole('heading', { name: 'Trash', exact: true }).waitFor()
  assert.equal(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth + 1), true)
  await page.setViewportSize({ width: 1440, height: 1000 })

  // Scenario 5: Unauthorized users (e.g. contributor) cannot publish
  profileRole = 'contributor'
  await page.goto(`${base}/admin/hymns/mezmur/media-only-draft/edit`)
  await page.reload()
  await page.getByRole('heading', { name: 'Edit Mezmur', exact: true }).waitFor()
  assert.equal(await page.getByRole('button', { name: 'Publish', exact: true }).count(), 0)

  // Scenario 5 (database boundary): an anonymous/anon-key caller cannot execute publication.
  const anonymousPublishStatus = await page.evaluate(async () => {
    const response = await fetch('https://approval-test.supabase.co/rest/v1/rpc/publish_mezmur_import', {
      method: 'POST',
      headers: {
        apikey: 'sb_publishable_approval_test',
        authorization: 'Bearer sb_publishable_approval_test',
        'content-type': 'application/json',
      },
      body: JSON.stringify({
        p_slug: 'existing-draft',
        p_expected_updated_at: null,
      }),
    })
    return response.status
  })
  assert.equal(anonymousPublishStatus, 403)

  assert.deepEqual(pageErrors, [])
  console.log(
    'Playwright Mezmur workflow E2E passed: draft/edit/publish/unpublish, Trash/restore/permanent-delete RBAC, relationship preservation, public hiding, contextual permission errors, and desktop/mobile layout.',
  )
} finally {
  await browser?.close()
  await server.close()
}
