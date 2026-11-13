import { useMemo, useState } from 'react'
import { qrMatrix } from '../../lib/play/roomQr'
import s from './RoomQrCode.module.css'

/**
 * Scannable QR code for a room link. Always dark-on-white with a four-module quiet zone, so it scans in the dark
 * theme and on a projector. "Enlarge" shows it big for a screen or TV.
 */
export function RoomQrCode({ link, code, am }: { link: string; code: string; am: boolean }) {
  const [large, setLarge] = useState(false)
  const matrix = useMemo(() => qrMatrix(link), [link])
  const quiet = 4
  const size = matrix.length + quiet * 2
  const path = useMemo(() => {
    let d = ''
    matrix.forEach((row, y) => { let x = 0; while (x < row.length) { if (!row[x]) { x += 1; continue } let end = x; while (end < row.length && row[end]) end += 1; d += `M${x + quiet} ${y + quiet}h${end - x}v1h-${end - x}z`; x = end } })
    return d
  }, [matrix])
  const label = am ? `ክፍል ${code} ለመቀላቀል QR ኮድ` : `QR code to join room ${code}`
  return (
    <figure className={`${s.qr} ${large ? s.large : ''}`} data-room-qr>
      <svg viewBox={`0 0 ${size} ${size}`} role="img" aria-label={label} shapeRendering="crispEdges">
        <rect width={size} height={size} fill="#fff" />
        <path d={path} fill="#0a1524" />
      </svg>
      <figcaption>{am ? 'በስልክ ካሜራ ይቃኙ' : 'Scan with a phone camera to join'}</figcaption>
      <button type="button" onClick={() => setLarge((value) => !value)} aria-pressed={large}>{large ? (am ? 'አሳንስ' : 'Make smaller') : (am ? 'አሳድግ' : 'Enlarge for a screen')}</button>
    </figure>
  )
}
