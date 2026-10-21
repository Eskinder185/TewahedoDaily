import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import type { CalendarQuestionResult, CalendarOccurrenceView } from '../../lib/searchBuddy/calendarQuestion.ts'
import type { QuestionLanguage } from '../../lib/searchBuddy/questionParse.ts'
import styles from './SearchBuddy.module.css'

export type CalendarOutcome =
  | { kind: 'idle' }
  | { kind: 'result'; query: string; result: CalendarQuestionResult }

function pickText(language: QuestionLanguage, en: string, am: string): string {
  return language === 'am' ? am : en
}

function categoryLabel(category: CalendarOccurrenceView['category'], t: (key: string) => string): string {
  const key = `searchBuddy.calendar.categories.${category}`
  const label = t(key)
  return label === key ? category : label
}

function relativeLabel(
  item: CalendarOccurrenceView,
  t: (key: string, params?: Record<string, string | number>) => string,
): string {
  if (item.relative === 'today') return t('searchBuddy.calendar.today')
  if (item.relative === 'tomorrow') return t('searchBuddy.calendar.tomorrow')
  if (item.relative === 'in_days' && item.daysRemaining > 1) {
    return t('searchBuddy.calendar.inDays', { count: item.daysRemaining })
  }
  return ''
}

function OccurrenceCard({
  item,
  language,
  onOpen,
}: {
  item: CalendarOccurrenceView
  language: QuestionLanguage
  onOpen: () => void
}) {
  const t = useTranslation()
  const name = language === 'am' && item.nameAmharic ? item.nameAmharic : item.name
  const relative = relativeLabel(item, t)
  return (
    <article className={styles.passageCard}>
      <p className={styles.relatedNote}>{categoryLabel(item.category, t)}</p>
      <p className={styles.passageText}>
        {name}
        {relative ? ` · ${relative}` : ''}
      </p>
      <p className={styles.attribution}>
        {item.ethiopianLabel} / {item.gregorianLabel}
        {item.weekday ? ` · ${item.weekday}` : ''}
      </p>
      {item.endGregorianIso ? (
        <p className={styles.attribution}>
          {t('searchBuddy.calendar.ends')} {item.endEthiopianLabel} / {item.endGregorianIso}
        </p>
      ) : null}
      <Link className={styles.openResult} to={item.href} onClick={onOpen}>
        {t('searchBuddy.calendar.open')}
      </Link>
    </article>
  )
}

export function CalendarAnswerPane({
  outcome,
  onChoose,
  onOpen,
}: {
  outcome: CalendarOutcome
  onChoose: (optionId: string) => void
  onOpen: () => void
}) {
  const t = useTranslation()
  if (outcome.kind === 'idle') return null
  const result = outcome.result
  const language = result.language
  const heading = t('searchBuddy.calendar.heading')

  if (result.kind === 'unsupported') {
    return (
      <div className={styles.errorBlock} role="status">
        <h4 className={styles.faithHeading}>{heading}</h4>
        <p className={styles.message}>{pickText(language, result.noticeEn, result.noticeAm)}</p>
      </div>
    )
  }

  if (result.kind === 'clarify' || result.kind === 'suggest') {
    const prompt = pickText(language, result.promptEn, result.promptAm)
    return (
      <div>
        <h4 className={styles.faithHeading}>{heading}</h4>
        <p className={styles.message}>{prompt}</p>
        <div className={styles.suggestions} role="group" aria-label={prompt}>
          {result.options.map((option) => (
            <button
              key={option.id}
              type="button"
              className={styles.chip}
              onClick={() => onChoose(option.id)}
            >
              {language === 'am' ? option.labelAm : option.labelEn}
            </button>
          ))}
        </div>
      </div>
    )
  }

  const notes = language === 'am' ? result.notesAm : result.notesEn
  return (
    <div>
      <h4 className={styles.faithHeading}>{heading}</h4>
      <p className={styles.message}>{pickText(language, result.headlineEn, result.headlineAm)}</p>
      <ul className={styles.passageList}>
        {result.occurrences.map((item) => (
          <li key={`${item.entryId}-${item.gregorianIso}`}>
            <OccurrenceCard item={item} language={language} onOpen={onOpen} />
          </li>
        ))}
      </ul>
      {notes.map((note) => (
        <p key={note} className={styles.attribution}>
          {note}
        </p>
      ))}
    </div>
  )
}
