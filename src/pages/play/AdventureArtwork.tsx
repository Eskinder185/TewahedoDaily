import { useId, type CSSProperties } from 'react'
import type { BibleAdventureStory } from '../../lib/play/bibleAdventureStories'
import { Hotspot } from './AdventureObjects'
import type { HotspotKit } from './adventureHotspots'
import styles from './AdventureArtwork.module.css'

type Props = {
  story: BibleAdventureStory
  scene: number
  kit: HotspotKit
}

/** Shared figure and landscape layers can be reused as further stories receive artwork. */
function Figure({ x, y, scale = 1, robe, gesture = 'rest' }: {
  x: number; y: number; scale?: number; robe: string; gesture?: 'rest' | 'staff' | 'look'
}) {
  return <g transform={`translate(${x} ${y}) scale(${scale})`} className={styles.figure}>
    <ellipse cx="1" cy="0" rx="18" ry="4" fill="var(--shadow)" opacity=".35" />
    <path d="M-11-42 Q0-49 11-42 L17-3 Q1 2-17-3Z" fill={robe} stroke="var(--ink)" strokeWidth="1.5" />
    <path d="M-4-40 Q-1-28-7-6 M5-41 Q8-25 11-6" fill="none" stroke="var(--cloth-fold)" strokeWidth="2" opacity=".6" />
    <path d="M-8-42 Q-17-32-16-21 M10-42 Q18-31 16-20" fill="none" stroke="var(--skin)" strokeWidth="5" strokeLinecap="round" />
    {gesture === 'look' && <path d="M11-40 Q20-48 28-51" fill="none" stroke="var(--skin)" strokeWidth="5" strokeLinecap="round" />}
    {gesture === 'staff' && <><path d="M10-40 L34-58" fill="none" stroke="var(--skin)" strokeWidth="5" strokeLinecap="round" /><path d="M34-59 L40 2" fill="none" stroke="var(--staff)" strokeWidth="3" strokeLinecap="round" /></>}
    <ellipse cx="0" cy="-53" rx="9" ry="11" fill="var(--skin)" stroke="var(--ink)" strokeWidth="1.5" />
    <path d="M-10-57 Q-7-68 2-66 Q11-65 11-55 Q5-60 0-60 Q-5-55-10-57Z" fill="var(--hair)" />
    <path d="M3-53 L6-52" stroke="var(--ink)" strokeWidth="1.2" strokeLinecap="round" />
  </g>
}

function Chariot({ x, y, scale = 1 }: { x: number; y: number; scale?: number }) {
  return <g transform={`translate(${x} ${y}) scale(${scale})`} className={styles.army}>
    <path d="M-51-19 Q-44-29-26-25 L-7-22 L1-34 L9-31 L7-20 L16-18 L14-12 L3-11 L-3-16 L-17-13 L-25-16 L-35-11 L-41 0 M-14-13 L-10 1 M-42-10 L-47 1" fill="var(--army)" stroke="var(--army-dark)" strokeWidth="2" strokeLinejoin="round" />
    <path d="M-43-23 L-53-29 M-23-21 L-8-13 M16-17 L24-21" fill="none" stroke="var(--army-dark)" strokeWidth="2" />
    <path d="M14-7 L63-12 L60-2 L28 2Z" fill="var(--chariot)" stroke="var(--army-dark)" strokeWidth="2" />
    <circle cx="31" cy="3" r="9" fill="var(--chariot)" stroke="var(--army-dark)" strokeWidth="3" />
    <circle cx="31" cy="3" r="2" fill="var(--gold)" />
    <path d="M45-11 L47-35 L56-31 L61-12" fill="var(--army)" stroke="var(--army-dark)" strokeWidth="2" />
    <circle cx="49" cy="-41" r="7" fill="var(--army)" />
    <path d="M42-44 L48-55 L58-43Z" fill="var(--army-dark)" />
    <path d="M58-32 L79-41" stroke="var(--army-dark)" strokeWidth="2" />
  </g>
}

function ManuscriptFrame() {
  return <g className={styles.ornament} aria-hidden="true">
    <rect x="10" y="10" width="580" height="430" rx="12" fill="none" stroke="var(--frame)" strokeWidth="2" />
    <rect x="17" y="17" width="566" height="416" rx="8" fill="none" stroke="var(--frame)" strokeWidth="1" opacity=".65" />
    <path d="M25 48 V28 H45 M555 28 H575 V48 M25 402 V422 H45 M555 422 H575 V402" fill="none" stroke="var(--gold)" strokeWidth="3" strokeLinecap="round" />
    <path d="M30 30 l7 7 7-7 -7-7Z M556 30 l7 7 7-7 -7-7Z M30 420 l7 7 7-7 -7-7Z M556 420 l7 7 7-7 -7-7Z" fill="var(--gold)" opacity=".85" />
    <path d="M270 22 h60 M278 27 h44 M270 428 h60 M278 423 h44" stroke="var(--frame)" strokeWidth="1.5" />
  </g>
}

function Sky({ scene, id }: { scene: number; id: string }) {
  return <>
    <rect width="600" height="450" fill={`url(#${id}-sky)`} />
    <path d="M0 190 Q86 148 164 177 T320 172 T600 159 V315 H0Z" fill="var(--far-hill)" opacity=".65" />
    <path d="M0 227 Q100 193 182 218 T360 206 T600 216 V345 H0Z" fill="var(--near-hill)" opacity=".75" />
    <g className={styles.cloud} fill="var(--cloud)" opacity={scene === 2 ? '.38' : '.55'}>
      <path d="M65 105 Q88 84 117 98 Q130 77 158 83 Q183 89 188 106 Q211 103 224 116 Q166 127 65 116Z" />
      <path d="M379 74 Q398 57 418 68 Q439 50 462 66 Q480 67 494 80 Q515 78 528 91 Q467 101 379 90Z" />
    </g>
    <path d="M0 233 Q180 220 345 230 T600 221" fill="none" stroke="var(--horizon)" strokeWidth="2" opacity=".75" />
  </>
}

function SceneOne({ kit }: { kit: HotspotKit }) {
  const campSeen = kit.stateOf('camp') === 'selected'
  const seaSeen = kit.stateOf('sea') === 'selected'
  return <>
    <path d="M0 243 Q104 211 221 238 Q281 228 320 241 L320 450 H0Z" fill="var(--sand-dark)" />
    <Hotspot kit={kit} id="sea" hit={[[335, 262, 245, 140]]}>
      <ellipse className={styles.halo} cx="452" cy="311" rx="130" ry="74" />
      <path d="M294 239 Q385 222 600 235 V450 H320 Q339 334 294 239Z" fill="url(#exodus-sea-water)" />
      <path className={`${styles.wave} ${seaSeen ? styles.still : ''}`} d="M316 270 Q372 256 427 271 T600 263 M344 304 Q410 288 473 305 T612 292 M325 347 Q409 331 474 348 T613 339 M333 388 Q405 374 470 394 T612 380" fill="none" stroke="var(--foam)" strokeWidth="3" opacity=".55" />
      <path d="M299 243 Q335 256 320 450" fill="none" stroke="var(--shoreline)" strokeWidth="7" />
    </Hotspot>
    <path d="M0 311 Q160 266 280 310 L319 450 H0Z" fill="url(#exodus-sand)" />
    <path d="M0 354 Q88 331 154 356 T310 343" fill="none" stroke="var(--sand-line)" strokeWidth="3" opacity=".6" />
    <g className={`${styles.dust} ${campSeen ? styles.approach : ''}`} aria-hidden="true">
      <path d="M5 219 Q53 179 104 200 Q142 179 186 204 Q232 189 263 218" fill="none" stroke="var(--dust)" strokeWidth="17" opacity=".35" />
      <Chariot x={87} y={223} scale={0.72} /><Chariot x={196} y={231} scale={0.53} />
      <path d="M0 239 Q136 226 272 247" fill="none" stroke="var(--army-dark)" strokeWidth="3" opacity=".45" />
    </g>
    <Hotspot kit={kit} id="camp" hit={[[60, 298, 225, 120]]}>
      <ellipse className={styles.halo} cx="175" cy="362" rx="121" ry="71" />
      <path d="M52 329 Q143 308 254 335" fill="none" stroke="var(--sand-line)" strokeWidth="3" />
      <g className={campSeen && !seaSeen ? styles.tremble : undefined}>
      <Figure x={116} y={362} scale={1.25} robe="var(--robe-blue)" gesture="look" />
      <Figure x={161} y={389} scale={1.5} robe="var(--robe-red)" />
      <Figure x={211} y={354} scale={1.05} robe="var(--robe-cream)" gesture="look" />
      <Figure x={262} y={396} scale={1.5} robe="var(--robe-gold)" gesture="staff" />
      </g>
    </Hotspot>
    <path d="M21 406 q34-11 72-4 M213 422 q30-9 65-5" fill="none" stroke="var(--sand-line)" strokeWidth="2" opacity=".65" />
  </>
}

function SceneTwo({ kit }: { kit: HotspotKit }) {
  const open = kit.stateOf('hand') === 'correct'
  return <g className={open ? styles.partOpen : styles.partClosed}>
    <path d="M0 247 Q300 222 600 247 V450 H0Z" fill="url(#exodus-sea-water)" />
    <g className={styles.closedOnly}><path className={styles.wave} d="M0 300 Q150 284 300 300 T600 296 M0 350 Q150 334 300 350 T600 346 M0 402 Q150 386 300 402 T600 398" fill="none" stroke="var(--foam)" strokeWidth="3" opacity=".5" /></g>
    <path className={styles.dryPath} d="M0 242 L207 244 L267 450 H0Z M393 244 L600 242 V450 H333Z" fill="var(--water-shadow)" />
    <g className={`${styles.wall} ${styles.wallLeft}`}>
      <path d="M0 247 Q72 209 164 233 Q205 244 215 285 L254 450 H0Z" fill="url(#exodus-wall-left)" />
      <path className={styles.wave} d="M7 267 Q73 236 161 263 M8 307 Q87 275 180 306 M4 351 Q85 318 193 353 M9 402 Q104 362 210 410" fill="none" stroke="var(--foam)" strokeWidth="5" opacity=".62" />
    </g>
    <g className={`${styles.wall} ${styles.wallRight}`}>
      <path d="M600 247 Q530 209 441 232 Q398 244 385 285 L346 450 H600Z" fill="url(#exodus-wall-right)" />
      <path className={styles.wave} d="M593 266 Q526 235 439 264 M592 306 Q512 273 420 307 M596 351 Q514 318 407 353 M591 402 Q496 362 390 410" fill="none" stroke="var(--foam)" strokeWidth="5" opacity=".62" />
    </g>
    <g className={styles.dryPath}>
      <path d="M215 250 Q258 243 300 249 Q342 243 385 250 L344 450 H256Z" fill="url(#exodus-sand)" />
      <path d="M215 250 L256 450 M385 250 L344 450" fill="none" stroke="var(--shoreline)" strokeWidth="4" opacity=".8" />
      <path d="M272 307 q27 7 55 0 M261 372 q38 11 78 0 M257 417 q43 12 88 0" fill="none" stroke="var(--sand-line)" strokeWidth="2" />
    </g>
    <g className={styles.wind} fill="none" stroke="var(--wind)" strokeWidth="3" strokeLinecap="round">
      <path d="M90 136 Q191 121 290 135 T507 116" /><path d="M37 168 Q129 150 228 161 T442 145" /><path d="M167 194 Q271 179 366 187 T576 171" />
    </g>
    <g className={styles.walker} data-walker style={{ '--dy': '150px', '--delay': '1.1s' } as CSSProperties}><Figure x={304} y={307} scale={0.57} robe="var(--robe-red)" /></g>
    <g className={styles.walker} data-walker style={{ '--dy': '120px', '--delay': '.7s' } as CSSProperties}><Figure x={328} y={340} scale={0.75} robe="var(--robe-blue)" /></g>
    <g className={styles.walker} data-walker style={{ '--dy': '85px', '--delay': '.3s' } as CSSProperties}><Figure x={280} y={365} scale={0.82} robe="var(--robe-cream)" /></g>
    <Hotspot kit={kit} id="hand" hit={[[190, 305, 110, 115]]}>
      <ellipse className={styles.halo} cx="246" cy="380" rx="78" ry="68" />
      <g className={styles.moses}><Figure x={241} y={424} scale={1.6} robe="var(--robe-gold)" gesture="staff" /></g>
      <path className={styles.rays} d="M295 322 L295 296 M281 328 L266 308 M309 328 L324 308 M274 340 L252 330 M316 340 L338 330" fill="none" stroke="var(--gold)" strokeWidth="4" strokeLinecap="round" />
    </Hotspot>
  </g>
}

function SceneThree({ kit }: { kit: HotspotKit }) {
  return <>
    <path d="M0 251 Q147 229 307 253 Q464 228 600 247 V450 H0Z" fill="url(#exodus-sea-water)" />
    <path className={styles.wave} d="M0 279 Q76 264 153 279 T308 275 T463 276 T618 272 M-5 317 Q78 303 158 318 T314 311 T472 316 T622 308 M-6 357 Q82 341 159 358 T318 351 T478 358 T625 349" fill="none" stroke="var(--foam)" strokeWidth="3" opacity=".6" />
    <path d="M0 368 Q130 341 258 366 Q402 342 600 354 V450 H0Z" fill="url(#exodus-sand)" />
    <path d="M0 372 Q125 349 258 373 Q418 348 600 361" fill="none" stroke="var(--shoreline)" strokeWidth="6" />
    <path d="M54 412 q45-13 99-5 M426 409 q42-11 89-4" fill="none" stroke="var(--sand-line)" strokeWidth="2" />
    <Hotspot kit={kit} id="lord-moses" hit={[[215, 305, 350, 115]]}>
      <ellipse className={styles.halo} cx="380" cy="378" rx="160" ry="66" />
      <g className={kit.stateOf('lord-moses') === 'correct' ? styles.lifted : styles.settled}>
      <Figure x={240} y={403} scale={1.4} robe="var(--robe-gold)" gesture="staff" />
      <Figure x={307} y={378} scale={1.1} robe="var(--robe-blue)" gesture="look" />
      <Figure x={356} y={412} scale={1.5} robe="var(--robe-red)" />
      <Figure x={421} y={381} scale={1.2} robe="var(--robe-cream)" />
      <Figure x={480} y={413} scale={1.45} robe="var(--robe-blue)" gesture="look" />
      <Figure x={535} y={390} scale={1.15} robe="var(--robe-gold)" />
      </g>
    </Hotspot>
    <path d="M78 237 Q170 218 246 235 M407 231 Q485 214 566 231" fill="none" stroke="var(--horizon)" strokeWidth="3" opacity=".5" />
  </>
}

/** Visible scene state and contextual feedback for the Exodus scenes; driven only by the shared answer state. */
function exodusState(scene: number, kit: HotspotKit): { state: string; note: string } {
  const wrong = (ids: string[]) => ids.some((id) => kit.stateOf(id) === 'incorrect')
  if (scene === 0) {
    const camp = kit.stateOf('camp') === 'selected'
    const sea = kit.stateOf('sea') === 'selected'
    return {
      state: camp && sea ? 'both' : camp ? 'camp' : sea ? 'sea' : 'idle',
      note: [camp && 'Pharaoh\u2019s army draws near and the people are afraid (Exodus 14:10).', sea && 'Moses tells them to stand still and see the Lord\u2019s deliverance (Exodus 14:13).'].filter(Boolean).join(' '),
    }
  }
  if (scene === 1) {
    if (kit.stateOf('hand') === 'correct') return { state: 'open', note: 'The Lord drove the sea back, and Israel went through on dry ground (Exodus 14:21\u201322).' }
    return wrong(['ship', 'stone']) ? { state: 'wrong', note: 'The sea has not parted. Look again at Exodus 14:21.' } : { state: 'closed', note: '' }
  }
  if (kit.stateOf('lord-moses') === 'correct') return { state: 'believed', note: 'Israel saw the Lord\u2019s great work, feared the Lord and believed (Exodus 14:30\u201331).' }
  return wrong(['pharaoh', 'egyptians']) ? { state: 'wrong', note: 'Look again at Exodus 14:31.' } : { state: 'idle', note: '' }
}

export function AdventureArtwork({ story, scene, kit }: Props) {
  const id = useId().replace(/:/g, '')
  if (story.id !== 'sea') return null
  const { state, note } = exodusState(scene, kit)
  return <div className={styles.artwork} role="region" lang="en" aria-label={`${story.title.en}, scene ${scene + 1}: ${story.scenes[scene].title.en}`} data-adventure-art="exodus" data-art-scene={scene + 1} data-art-state={state}>
    <svg key={scene} viewBox="0 0 600 450" preserveAspectRatio="xMidYMid slice" focusable="false">
      <defs>
        <linearGradient id={`${id}-sky`} x2="0" y2="1"><stop offset="0" stopColor="var(--sky-top)" /><stop offset=".72" stopColor="var(--sky-bottom)" /><stop offset="1" stopColor="var(--horizon)" /></linearGradient>
        <linearGradient id="exodus-sand" x2="0" y2="1"><stop offset="0" stopColor="var(--sand-light)" /><stop offset="1" stopColor="var(--sand-dark)" /></linearGradient>
        <linearGradient id="exodus-sea-water" x2="0" y2="1"><stop offset="0" stopColor="var(--water-light)" /><stop offset="1" stopColor="var(--water-dark)" /></linearGradient>
        <linearGradient id="exodus-wall-left"><stop offset="0" stopColor="var(--water-dark)" /><stop offset=".73" stopColor="var(--water-light)" /><stop offset="1" stopColor="var(--foam)" /></linearGradient>
        <linearGradient id="exodus-wall-right"><stop offset="0" stopColor="var(--foam)" /><stop offset=".27" stopColor="var(--water-light)" /><stop offset="1" stopColor="var(--water-dark)" /></linearGradient>
      </defs>
      <Sky scene={scene} id={id} />
      {scene === 0 && <SceneOne kit={kit} />}
      {scene === 1 && <SceneTwo kit={kit} />}
      {scene === 2 && <SceneThree kit={kit} />}
      <ManuscriptFrame />
    </svg>
    {note && <span className={styles.stateNote} role="status" lang="en" data-art-note>{note}</span>}
    <span className={styles.caption}>{story.passage} · {scene + 1}/3</span>
  </div>
}
