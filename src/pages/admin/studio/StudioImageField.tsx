import { useId, useState } from 'react'
import type { PlayImage } from '../../../lib/play/imageCatalog'
import s from './Studio.module.css'

/** Reference edits only: never uploads or removes a shared storage object. */
export function StudioImageField({ item, index, available, used, onChange, onUndo }: {
  item: PlayImage; index: number; available: PlayImage[]; used: string[]
  onChange: (image: PlayImage) => void; onUndo?: () => void
}) {
  const [choosing, setChoosing] = useState(false)
  const pickerId = useId()
  const src = item.src || item.fallbackSrc
  return <section className={s.group} aria-label={`Card image ${index + 1}`}>
    {src ? <img className={s.thumbnail} src={src} alt={item.description} loading="lazy" />
      : <p role="status">Image removed. A replacement is required to play or publish. / ምስሉ ተወግዷል፤ ከጨዋታ ወይም ከህትመት በፊት ይተኩ።</p>}
    <div className={s.actions}>
      <button type="button" aria-expanded={choosing} onClick={() => setChoosing(!choosing)}>Change Image / ምስል ቀይር</button>
      <button type="button" disabled={!src} onClick={() => onChange({ ...item, src: '', fallbackSrc: '' })}>Remove Image / ምስል አስወግድ</button>
      {onUndo && <button type="button" onClick={onUndo}>Undo image change / ለውጡን መልስ</button>}
    </div>
    {choosing && <>
      <p className={s.hint}>Choose approved game artwork. Choosing another subject also loads its matching answer and source. Shared images are never deleted. / የተፈቀደ ምስል ይምረጡ፤ ተዛማጅ መልሱና ምንጩም ይጫናሉ።</p>
      <div className={s.field}><label htmlFor={pickerId}>Approved catalog image {index + 1} / ሥዕል</label><select id={pickerId} value="" onChange={event => {
        const selected = available.find(image => image.id === event.target.value)
        if (selected && !used.includes(selected.id)) {
          onChange(selected.id === item.id ? { ...item, src: selected.src, fallbackSrc: selected.fallbackSrc } : structuredClone(selected))
          setChoosing(false)
        }
      }}><option value="">Choose image / ምስል ይምረጡ</option>{available.map(image => <option disabled={used.includes(image.id)} key={image.id} value={image.id}>{image.answer.en} · {image.answer.am}</option>)}</select></div>
    </>}
  </section>
}
