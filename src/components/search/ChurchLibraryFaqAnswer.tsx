import { Link } from 'react-router-dom'
import { faqSourceHref, type ChurchLibraryFaqMatch } from '../../lib/searchBuddy/churchLibraryFaq'
import styles from './SearchBuddy.module.css'

export function ChurchLibraryFaqAnswer({ match }: { match: ChurchLibraryFaqMatch }) {
  return (
    <section className={styles.passageCard} aria-labelledby="approved-faq-answer">
      <h3 id="approved-faq-answer">{match.language === 'am' ? 'የተረጋገጠ መልስ' : 'Verified answer'}</h3>
      <p className={styles.passageText} lang={match.language}>{match.answer}</p>
      <div>
        <strong>{match.language === 'am' ? 'ምንጮች' : 'Sources'}</strong>
        {match.sources.map((source) => (
          <p className={styles.attribution} key={`${source.book_slug}-${source.passage_key || source.section_key || ''}`}>
            <Link to={faqSourceHref(source)}>
              {source.book_title}
              {source.chapter_title ? ` · ${source.chapter_title}` : ''}
              {source.section_title ? ` · ${source.section_title}` : ''} →
            </Link>
          </p>
        ))}
      </div>
    </section>
  )
}
