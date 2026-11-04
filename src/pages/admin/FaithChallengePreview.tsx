import { useState } from 'react'
import { Link } from 'react-router-dom'
import type { QuestionDraft } from '../../lib/play/questionLibrary'
import game from '../../components/play/GameShell.module.css'
import s from './PlayContentReview.module.css'

const object = (value: unknown): Record<string, unknown> => value && typeof value === 'object' && !Array.isArray(value)
  ? value as Record<string, unknown> : {}
const string = (value: unknown) => typeof value === 'string' ? value : ''
const label = (value: unknown, locale: 'en' | 'am') => {
  const item = object(value)
  return string(item[locale]) || string(item.en)
}

export function FaithChallengePreview({ draft, locale }: { draft: QuestionDraft; locale: 'en' | 'am' }) {
  const [selected, setSelected] = useState<string | null>(null)
  const payload = draft.payload
  const options = Array.isArray(payload.options) ? payload.options.map(object) : []
  const hasOptions = !['who-am-i', 'match'].includes(draft.game_type)
  const source = object(payload.source)
  const correctKey = string(payload.correctKey)
  const prompt = draft.game_type === 'who-am-i' ? (locale === 'am' ? 'እኔ ማን ነኝ?' : 'Who Am I?')
    : draft.game_type === 'match' ? label(payload.left, locale) : label(payload.prompt, locale)
  return <section className={s.previewPanel} aria-label={locale === 'am' ? 'የጥያቄ ቅድመ እይታ' : 'Question preview'}>
    <p className={s.previewNote}>{locale === 'am' ? 'የአርትዖት ቅድመ እይታ · ነጥብ አይሰጥም' : 'Editorial preview · no progress or XP is recorded'}</p>
    <article className={game.questionCard}>
      {string(payload.emoji) && <div className={game.emoji} aria-label={locale === 'am' ? 'የኢሞጂ ፍንጭ' : 'Emoji clues'}>{string(payload.emoji)}</div>}
      {label(payload.excerpt, locale) && <p className={game.excerpt}>{label(payload.excerpt, locale)}</p>}
      {locale === 'am' && !string(object(payload.prompt).am || object(payload.answer).am || object(payload.left).am) &&
        <p className={s.previewNote}>የአማርኛ ጽሑፍ ስለሌለ የእንግሊዝኛ ጽሑፍ ታይቷል።</p>}
      <h2>{prompt || (locale === 'am' ? 'ጥያቄ ያስገቡ' : 'Add a question to preview it')}</h2>
      {hasOptions ? <div className={game.options}>{options.map((option, index) => {
        const key = string(option.key) || String(index)
        const right = selected !== null && key === correctKey
        const wrong = selected === key && !right
        return <button key={key} type="button" className={`${game.option} ${right ? game.correct : ''} ${wrong ? game.incorrect : ''}`}
          disabled={selected !== null || !label(option.text, locale)} onClick={() => setSelected(key)}>
          {label(option.text, locale) || (locale === 'am' ? 'የመልስ አማራጭ' : 'Answer option')}
        </button>
      })}</div> : <div className={s.previewPair}>
        <span>{draft.game_type === 'match' ? label(payload.left, locale) : (locale === 'am' ? 'መልስ' : 'Answer')}</span>
        <span aria-hidden="true">→</span><strong>{draft.game_type === 'match' ? label(payload.right, locale) : label(payload.answer, locale)}</strong>
      </div>}
      {(selected !== null || !hasOptions) && <div className={game.feedback} role="status">
        {hasOptions && <strong>{selected === correctKey ? (locale === 'am' ? 'ትክክል' : 'Correct') : (locale === 'am' ? 'ትክክለኛ መልስ' : 'Correct answer')}: {label(options.find((option) => option.key === correctKey)?.text, locale)}</strong>}
        <p>{label(payload.explanation, locale)}</p>
        {string(source.route).startsWith('/') && !string(source.route).startsWith('//') &&
          <Link className={game.source} to={string(source.route)}>{string(source.label) || string(source.route)}</Link>}
      </div>}
      {selected !== null && hasOptions && <button type="button" className={s.previewReset} onClick={() => setSelected(null)}>{locale === 'am' ? 'እንደገና ይመልከቱ' : 'Preview again'}</button>}
    </article>
    {['who-am-i', 'match'].includes(draft.game_type) && <p className={s.previewNote}>{locale === 'am' ? 'ይህ የCMS ቅድመ እይታ ነው፤ የሕዝብ ጨዋታው አሁን የአካባቢ ካርዶችን ይጠቀማል።' : 'CMS card preview. The public game currently uses its local card bank.'}</p>}
  </section>
}
