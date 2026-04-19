import { useCallback, useId, useState } from 'react'
import {
  buildCustomPracticePayload,
  type ChantPracticePayload,
} from './chantPracticeModel'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './CustomChantPractice.module.css'

type Props = {
  onLoad: (payload: ChantPracticePayload) => void
}

export function CustomChantPractice({ onLoad }: Props) {
  const t = useUiLabel()
  const urlFieldId = useId()
  const [youtubeUrl, setYoutubeUrl] = useState('')
  const [title, setTitle] = useState('')
  const [lyrics, setLyrics] = useState('')
  const [transliteration, setTransliteration] = useState('')
  const [notes, setNotes] = useState('')
  const [error, setError] = useState<string | null>(null)

  const handleLoad = useCallback(() => {
    setError(null)
    const result = buildCustomPracticePayload({
      youtubeUrl,
      title: title || undefined,
      lyricsGez: lyrics || undefined,
      transliterationLyrics: transliteration || undefined,
      notes: notes || undefined,
    })
    if (!result.ok) {
      setError(
        result.error === 'missing_url'
          ? t('practiceCustomErrMissing')
          : t('practiceCustomErrInvalid'),
      )
      return
    }
    onLoad(result.payload)
  }, [youtubeUrl, title, lyrics, transliteration, notes, onLoad, t])

  return (
    <div className={styles.formRoot}>
      <div className={styles.fields}>
        <label className={styles.field} htmlFor={urlFieldId}>
          <span className={styles.label}>{t('practiceCustomUrlLabel')}</span>
          <input
            id={urlFieldId}
            type="url"
            name="custom-youtube"
            className={styles.input}
            placeholder={t('practiceCustomUrlPlaceholder')}
            value={youtubeUrl}
            onChange={(e) => {
              setYoutubeUrl(e.target.value)
              setError(null)
            }}
            autoComplete="off"
            spellCheck={false}
            enterKeyHint="go"
          />
        </label>

        <details className={styles.optional}>
          <summary className={styles.optionalSummary}>
            {t('practiceCustomOptionalDetails')}
          </summary>
          <div className={styles.optionalBody}>
            <label className={styles.field}>
              <span className={styles.label}>{t('practiceCustomTitleOpt')}</span>
              <input
                type="text"
                className={styles.input}
                placeholder={t('practiceCustomTitlePlaceholder')}
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                autoComplete="off"
              />
            </label>

            <label className={styles.field}>
              <span className={styles.label}>{t('practiceCustomLyricsOpt')}</span>
              <textarea
                className={styles.textarea}
                placeholder={t('practiceCustomLyricsPlaceholder')}
                value={lyrics}
                onChange={(e) => setLyrics(e.target.value)}
                rows={3}
                spellCheck={false}
              />
            </label>

            <label className={styles.field}>
              <span className={styles.label}>{t('practiceCustomTranslitOpt')}</span>
              <textarea
                className={styles.textarea}
                placeholder={t('practiceCustomTranslitPlaceholder')}
                value={transliteration}
                onChange={(e) => setTransliteration(e.target.value)}
                rows={2}
                spellCheck={false}
              />
            </label>

            <label className={styles.field}>
              <span className={styles.label}>{t('practiceCustomNotesOpt')}</span>
              <textarea
                className={styles.textarea}
                placeholder={t('practiceCustomNotesPlaceholder')}
                value={notes}
                onChange={(e) => setNotes(e.target.value)}
                rows={2}
                spellCheck={false}
              />
            </label>
          </div>
        </details>
      </div>

      {error ? (
        <p className={styles.error} role="alert">
          {error}
        </p>
      ) : null}

      <div className={styles.actions}>
        <button type="button" className={styles.primary} onClick={handleLoad}>
          {t('practiceCustomLoadVideo')}
        </button>
      </div>
    </div>
  )
}
