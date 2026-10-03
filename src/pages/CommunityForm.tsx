import { useState, type FormEvent } from 'react'
import { Link, useLocation, useSearchParams } from 'react-router-dom'
import { useTranslation } from '../i18n'
import { Turnstile } from '../components/community/Turnstile'
import { isSupabaseConfigured, submitCommunityPayload } from '../lib/community/submit'
import { correctionTypes, limits, validateSubmission } from '../lib/community/validation'
import s from './CommunityForm.module.css'

export function CommunityForm() {
  const t = useTranslation()
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
      if (turnstileEnabled && !token) throw new Error(t('forms.verifyChallenge'))
      setBusy(true)
      const ref = await submitCommunityPayload(payload, {
        website: String(fields.website || ''),
        turnstileToken: token,
      })
      setReference(ref)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : t('forms.submitFailed'))
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
          <p className={s.eyebrow}>{t('forms.thankYouEyebrow')}</p>
          <h1>{t('forms.receivedTitle')}</h1>
          <p>{t('forms.receivedRef', { reference })}</p>
          <p>{t('forms.receivedReview')}</p>
          <Link to="/practice">{t('forms.returnLibrary')}</Link>
        </div>
      </section>
    )
  }

  return (
    <section className={s.shell}>
      <header>
        <p className={s.eyebrow}>{t('forms.eyebrow')}</p>
        <h1>{correction ? t('forms.correctionTitle') : t('forms.mezmurTitle')}</h1>
        <p>{t('forms.intro')}</p>
        <p className={s.muted}>{t('forms.noAccount')}</p>
      </header>
      {!configured && (
        <p role="status" className={s.notice}>
          {t('forms.notConfigured')}
        </p>
      )}
      <form onSubmit={submit} className={s.card}>
        <fieldset disabled={busy || !configured}>
          {correction ? (
            <>
              <p>
                {t('forms.correctionFor')}{' '}
                <strong>{params.get('title') || 'Mezmur'}</strong>
              </p>
              <input type="hidden" name="title" value={params.get('title') || ''} />
              <label>
                {t('forms.correctionType')} *
                <select name="correction_type" aria-label={t('forms.correctionType')} required>
                  <option value="">{t('forms.chooseIssue')}</option>
                  {correctionTypes.map((type) => (
                    <option value={type} key={type}>
                      {type.replaceAll('_', ' ')}
                    </option>
                  ))}
                </select>
              </label>
              {field('suggested_correction', t('forms.suggestedCorrection'), true, true)}
              {field('explanation', t('forms.explanation'), true, true)}
            </>
          ) : (
            <>
              {field('title', t('forms.mezmurTitleField'), false, true)}
              {field('title_amharic', t('forms.amharicTitle'))}
              {field('singer_name', t('forms.singer'))}
              {field('youtube_url', t('forms.youtube'))}
              <p className={s.muted}>{t('forms.titleOrLyricsHint')}</p>
              {field('lyrics_amharic', t('forms.lyricsAmharic'), true)}
              {field('lyrics_english', t('forms.lyricsEnglish'), true)}
              {field('lyrics_oromo', t('forms.lyricsOromo'), true)}
              {field('transliteration', t('forms.transliteration'), true)}
              {field('suggested_category', t('forms.suggestedCategory'))}
              <label>
                {t('forms.suggestedTags')}
                <input
                  name="suggested_tags"
                  maxLength={1200}
                  placeholder={t('forms.tagsPlaceholder')}
                />
              </label>
              {field('source_notes', t('forms.additionalNotes'), true)}
            </>
          )}
          {field('source_reference', t('forms.sourceReference'))}
          <h2>{t('forms.yourContribution')}</h2>
          {field('contributor_name', t('forms.contributorName'), false, true)}
          {field('contributor_email', t('forms.contributorEmail'))}
          <p className={s.muted}>{t('forms.emailPrivacy')}</p>
          <label className={s.check}>
            <input type="checkbox" name="credit_requested" />
            {t('forms.creditMe')}
          </label>
          <p className={s.muted}>{t('forms.creditNote')}</p>
          <div className={s.trap} aria-hidden="true">
            <label htmlFor="community-website-hp" className={s.trapLabel}>
              Website
            </label>
            <input
              id="community-website-hp"
              name="website"
              type="text"
              tabIndex={-1}
              autoComplete="off"
              aria-hidden="true"
            />
          </div>
          {configured && turnstileEnabled && <Turnstile key={attempt} onToken={setToken} />}
          {error && (
            <p role="alert" className={s.error}>
              {error}
            </p>
          )}
          <button type="submit" disabled={busy || (turnstileEnabled && !token)}>
            {busy
              ? t('forms.submitting')
              : correction
                ? t('forms.sendCorrection')
                : t('forms.submitReview')}
          </button>
        </fieldset>
      </form>
    </section>
  )
}
