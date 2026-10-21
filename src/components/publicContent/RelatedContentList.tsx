import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import {
  relationTypeLabel,
  type ResolvedRelated,
} from '../../lib/cms/contentRelations'
import s from './RelatedContentList.module.css'

type Props = {
  items: ResolvedRelated[]
  heading?: string
  /** Count of stored relations that were requested. Used only for the empty state. */
  requestedCount?: number
}

/**
 * Public related-content list. Only render resolved, published targets —
 * never invent titles or links for missing rows.
 */
export function RelatedContentList({
  items,
  heading,
  requestedCount = 0,
}: Props) {
  const t = useTranslation()
  const title = heading || t('calendar.page.hymnsHeading')
  if (!items.length) {
    if (requestedCount < 1) return null
    return <p className={s.missing}>{t('calendar.page.relationsMissing')}</p>
  }
  return (
    <section className={s.root} aria-labelledby="related-content-heading">
      <h2 id="related-content-heading" className={s.heading}>
        {title}
      </h2>
      <ul className={s.list}>
        {items.map((item) => (
          <li key={`${item.type}:${item.id}`}>
            <Link to={item.route} className={s.link}>
              <span className={s.type}>{relationTypeLabel(item.type)}</span>
              <span className={s.title}>{item.title}</span>
            </Link>
          </li>
        ))}
      </ul>
    </section>
  )
}
