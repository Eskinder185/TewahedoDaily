import type { AiAnswerBlock, AiAnswerInline } from '../../../lib/searchBuddy/formatAiAnswer.ts'
import { parseAiAnswerBlocks, stripDecorativeMarkdown } from '../../../lib/searchBuddy/formatAiAnswer.ts'
import styles from './ResultCard.module.css'

function InlineParts({ parts }: { parts: AiAnswerInline[] }) {
  return (
    <>
      {parts.map((part, index) => {
        if (part.type === 'strong') return <strong key={index}>{part.text}</strong>
        if (part.type === 'em') return <em key={index}>{part.text}</em>
        if (part.type === 'link') {
          return (
            <a key={index} href={part.href} target="_blank" rel="noopener noreferrer">
              {part.text}
            </a>
          )
        }
        return <span key={index}>{part.text}</span>
      })}
    </>
  )
}

function BlockView({ block }: { block: AiAnswerBlock }) {
  if (block.type === 'heading') {
    const Tag = block.level === 2 ? 'h3' : 'h4'
    return (
      <Tag className={styles.aiHeading}>
        <InlineParts parts={block.inlines} />
      </Tag>
    )
  }

  if (block.type === 'list') {
    const Tag = block.ordered ? 'ol' : 'ul'
    return (
      <Tag className={styles.aiList}>
        {block.items.map((item, index) => (
          <li key={index}>
            <InlineParts parts={item} />
          </li>
        ))}
      </Tag>
    )
  }

  if (block.type === 'label') {
    const className =
      block.kind === 'amharic'
        ? `${styles.aiLabelLine} ${styles.aiLabelAm}`
        : block.kind === 'bible'
          ? `${styles.aiLabelLine} ${styles.aiLabelBible}`
          : `${styles.aiLabelLine} ${styles.aiLabelEn}`
    const lang = block.kind === 'amharic' ? 'am' : block.kind === 'english' ? 'en' : undefined
    return (
      <p className={className} lang={lang}>
        <InlineParts parts={block.inlines} />
      </p>
    )
  }

  return (
    <p
      className={styles.aiParagraph}
      lang={block.lang === 'am' ? 'am' : block.lang === 'en' ? 'en' : undefined}
    >
      <InlineParts parts={block.inlines} />
    </p>
  )
}

/** Renders AI explanation with safe structure — no HTML injection. */
export function AiAnswerBody({ answer }: { answer: string }) {
  const blocks = parseAiAnswerBlocks(answer)
  if (!blocks.length) {
    const plain = stripDecorativeMarkdown(answer).trim()
    if (!plain) return null
    return <p className={styles.aiBody}>{plain}</p>
  }
  return (
    <div className={styles.aiBodyStructured}>
      {blocks.map((block, index) => (
        <BlockView key={index} block={block} />
      ))}
    </div>
  )
}
