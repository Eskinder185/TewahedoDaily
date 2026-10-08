import type { EditorialContent, EditorialKind } from '../../lib/cms/contentService'
import { encyclopediaTemplateKind } from '../../lib/cms/contentRelations'
import { ContentBody } from './ContentBody'
import s from './EncyclopediaTopic.module.css'

type Props = {
  item: EditorialContent
  kind?: EditorialKind
  preview?: boolean
}

/**
 * Presentation shell for encyclopedia / sacrament / terminology topics.
 * Reuses ContentBody; template attribute is for future styling only.
 * Does not invent teaching text.
 */
export function EncyclopediaTopic({
  item,
  kind = 'articles',
  preview = false,
}: Props) {
  const template = encyclopediaTemplateKind(item.teaching_category)
  return (
    <div className={s.root} data-template={template}>
      <ContentBody item={item} kind={kind} preview={preview} />
    </div>
  )
}
