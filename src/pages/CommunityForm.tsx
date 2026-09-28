import { useState, type FormEvent } from 'react'
import { Link, useLocation, useSearchParams } from 'react-router-dom'
import { Turnstile } from '../components/community/Turnstile'
import { isSupabaseConfigured, submitCommunityPayload } from '../lib/community/submit'
import { correctionTypes, limits, validateSubmission } from '../lib/community/validation'
import s from './CommunityForm.module.css'

export function CommunityForm() {
  const [params] = useSearchParams()
  const correction = useLocation().pathname === '/suggest-correction'
  const [token, setToken] = useState('')
  const [attempt, setAttempt] = useState(0)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [reference, setReference] = useState('')
  const turnstileEnabled = !!import.meta.env.VITE_TURNSTILE_SITE_KEY?.trim()
  const configured = isSupabaseConfigured

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    setError('')
    const data = new FormData(event.currentTarget)
    try {
      const fields = Object.fromEntries(data)
      const payload = validateSubmission({
        ...fields,
        submission_type: correction ? 'correction' : 'mezmur',
        suggested_tags: String(fields.suggested_tags || '')
          .split(',')
          .map((tag) => tag.trim())
          .filter(Boolean),
        credit_requested: data.has('credit_requested'),
        related_content_id: params.get('content_id') || '',
        related_legacy_key: params.get('legacy_key') || '',
        related_content_title: params.get('title') || '',
        current_page_url: params.get('page') || '',
      })
      if (turnstileEnabled && !token) throw new Error('Complete the verification challenge.')
      setBusy(true)
      const ref = await submitCommunityPayload(payload, {
        website: String(fields.website || ''),
        turnstileToken: token,
      })
      setReference(ref)
    } catch (cause) {
      setError(
        cause instanceof Error
          ? cause.message
          : 'Unable to submit. Your form has been kept; please try again.',
      )
    } finally {
      setBusy(false)
      setToken('')
      setAttempt((n) => n + 1)
    }
  }

  const field = (
    key: keyof typeof limits,
    text: string,
    area = false,
    required = false,
    value?: string,
  ) => (
    <label key={key}>
      {text}
      {required ? ' *' : ''}
      {area ? (
        <textarea name={key} maxLength={limits[key]} required={required} rows={5} defaultValue={value} />
      ) : (
        <input
          name={key}
          type={key === 'contributor_email' ? 'email' : 'text'}
          maxLength={limits[key]}
          required={required}
          defaultValue={value}
        />
      )}
    </label>
  )

  if (reference) {
    return (
      <section className={s.shell}>
        <div className={s.card} role="status">
          <p className={s.eyebrow}>THANK YOU FOR CONTRIBUTING</p>
          <h1>Submission received</h1>
          <p>
            Your reference is <strong>{reference}</strong>. Please keep it for any follow-up.
          </p>
          <p>
            Our editors will review and verify your contribution. Nothing is published automatically.
          </p>
          <Link to="/practice">Return to the Mezmur library →</Link>
        </div>
      </section>
    )
  }

  return (
    <section className={s.shell}>
      <header>
        <p className={s.eyebrow}>HELP GROW OUR SHARED LIBRARY</p>
        <h1>{correction ? 'Suggest a Correction' : 'Submit a Mezmur'}</h1>
        <p>
          Share a hymn or help improve an existing entry. Every contribution is reviewed and verified
          before it can become a draft, receive final review, and be published.
        </p>
        <p className={s.muted}>No account is needed. Your email will never be displayed publicly.</p>
      </header>
      {!configured && (
        <p role="status" className={s.notice}>
          Community submissions are not configured yet. Please check back soon.
        </p>
      )}
      <form onSubmit={submit} className={s.card}>
        <fieldset disabled={busy || !configured}>
          {correction ? (
            <>
              <p>
                Correction for <strong>{params.get('title') || 'Mezmur'}</strong>
              </p>
              <input type="hidden" name="title" value={params.get('title') || ''} />
              <label>
                Correction type *
                <select name="correction_type" aria-label="Correction type" required>
                  <option value="">Choose an issue</option>
                  {correctionTypes.map((type) => (
                    <option value={type} key={type}>
                      {type.replaceAll('_', ' ')}
                    </option>
                  ))}
                </select>
              </label>
              {field('suggested_correction', 'Suggested correction', true, true)}
              {field('explanation', 'Explanation', true, true)}
            </>
          ) : (
            <>
              {field('title', 'Mezmur title', false, true)}
              {field('title_amharic', 'Amharic title')}
              {field('singer_name', 'Singer / choir')}
              {field('youtube_url', 'YouTube link')}
              <p className={s.muted}>Add a recognizable title and either a YouTube video link or lyrics.</p>
              {field('lyrics_amharic', 'Amharic lyrics', true)}
              {field('lyrics_english', 'English lyrics', true)}
              {field('lyrics_oromo', 'Oromo lyrics', true)}
              {field('transliteration', 'Transliteration', true)}
              {field('suggested_category', 'Suggested category')}
              <label>
                Suggested tags
                <input name="suggested_tags" maxLength={1200} placeholder="Separate tags with commas" />
              </label>
              {field('source_notes', 'Additional notes', true)}
            </>
          )}
          {field('source_reference', 'Source / reference')}
          <h2>Your contribution</h2>
          {field('contributor_name', 'Contributor name', false, true)}
          {field('contributor_email', 'Contributor email (optional)')}
          <p className={s.muted}>
            An email address lets reviewers contact you if clarification is needed. It is visible only to
            authorized reviewers.
          </p>
          <label className={s.check}>
            <input type="checkbox" name="credit_requested" />
            Credit me if this submission is published
          </label>
          <p className={s.muted}>
            Your name will be public only if you request credit and an editor chooses to include it. Please
            share only material you have permission to contribute, and avoid private information in lyrics or
            notes.
          </p>
          <div className={s.trap} aria-hidden="true">
            <label>
              Website
              <input name="website" tabIndex={-1} autoComplete="off" />
            </label>
          </div>
          {configured && turnstileEnabled && <Turnstile key={attempt} onToken={setToken} />}
          {error && (
            <p role="alert" className={s.error}>
              {error}
            </p>
          )}
          <button type="submit" disabled={busy || (turnstileEnabled && !token)}>
            {busy ? 'Submitting…' : correction ? 'Send correction' : 'Submit for review'}
          </button>
        </fieldset>
      </form>
    </section>
  )
}
