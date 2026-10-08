import { Link } from 'react-router-dom'
import {
  relationTypeLabel,
  type ResolvedRelated,
} from '../../lib/cms/contentRelations'
import s from './RelatedContentList.module.css'

type Props = {
  items: ResolvedRelated[]
  heading?: string
}

/**
 * Public related-content list. Only render resolved, published targets —
 * never invent titles or links for missing rows.
 */
export function RelatedContentList({
  items,
  heading = 'Related reading and hymns',
}: Props) {
  if (!items.length) return null
  return (
    <section className={s.root} aria-labelledby="related-content-heading">
      <h2 id="related-content-heading" className={s.heading}>
        {heading}
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
