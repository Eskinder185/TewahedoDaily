import type { CSSProperties, ReactNode } from 'react'
import { HOTSPOT_LABELS, type HotspotKit, type ObjectState, type Rect } from './adventureHotspots'
import styles from './AdventureArtwork.module.css'

const stateSuffix: Record<ObjectState, string> = { idle: '', selected: ', explored', correct: ', correct answer', incorrect: ', incorrect answer' }

/** A single interactive illustrated object: native-style button semantics on an SVG group. */
export function Hotspot({ kit, id, hit, children }: { kit: HotspotKit; id: string; hit: readonly Rect[]; children: ReactNode }) {
  const label = HOTSPOT_LABELS[kit.storyId]?.[kit.scene]?.[id]
  if (!label) return <g aria-hidden="true">{children}</g>
  const state = kit.stateOf(id)
  const cls = [
    styles.hotspot,
    kit.activeObject === id && styles.active,
    state === 'selected' && styles.selected,
    state === 'correct' && styles.correct,
    state === 'incorrect' && styles.incorrect,
  ].filter(Boolean).join(' ')
  const [mx, my] = [hit[0][0] + hit[0][2] - 13, hit[0][1] + 13]
  return <g
    className={cls}
    data-object={id}
    role="button"
    tabIndex={0}
    aria-label={`${label}${stateSuffix[state]}`}
    aria-pressed={state !== 'idle'}
    aria-disabled={kit.locked || undefined}
    onClick={() => kit.onSelect(id)}
    onKeyDown={(event) => {
      if (event.key !== 'Enter' && event.key !== ' ') return
      event.preventDefault()
      if (!event.repeat) kit.onSelect(id)
    }}
    onPointerEnter={(event) => { if (event.pointerType === 'mouse') kit.onHover(id) }}
    onPointerLeave={(event) => { if (event.pointerType === 'mouse') kit.onHover(null) }}
    onFocus={() => kit.onFocusObject(id)}
    onBlur={() => kit.onFocusObject(null)}
  >
    {children}
    {hit.map(([x, y, w, h], index) => <g key={index}>
      <rect className={styles.ring} x={x - 3} y={y - 3} width={w + 6} height={h + 6} rx="16" />
      <rect className={styles.hit} data-hit={id} x={x} y={y} width={w} height={h} rx="13" />
    </g>)}
    {state !== 'idle' && <g className={styles.marker} aria-hidden="true">
      <circle cx={mx} cy={my} r="11" />
      <text x={mx} y={my + 5} textAnchor="middle">{state === 'incorrect' ? '✕' : '✓'}</text>
    </g>}
  </g>
}

type Robe = 'oBlue' | 'oRed' | 'oCream' | 'oGoldRobe' | 'oDark'

function Person({ x, y, s = 1, robe, crown, rotate = 0, halo }: { x: number; y: number; s?: number; robe: Robe; crown?: boolean; rotate?: number; halo?: boolean }) {
  return <g transform={`translate(${x} ${y}) rotate(${rotate}) scale(${s})`}>
    <ellipse cx="0" cy="1" rx="15" ry="3.5" className={styles.oShadow} />
    <path d="M-12 0 L-8-34 Q0-41 8-34 L12 0Z" className={styles[robe]} />
    <path d="M-8-33 Q-17-22-14-12 M8-33 Q17-22 14-12" className={styles.oArm} />
    <circle cx="0" cy="-44" r="8.5" className={styles.oSkin} />
    <path d="M-9-46 Q-6-56 2-54 Q10-53 9-45 Q4-49 0-49 Q-5-45-9-46Z" className={styles.oHair} />
    {crown && <path d="M-8-52 L-8-61 L-4-56 L0-63 L4-56 L8-61 L8-52Z" className={styles.oGold} />}
    {halo && <circle cx="0" cy="-45" r="14" className={styles.oHalo} />}
  </g>
}

const Sheep = ({ x, y }: { x: number; y: number }) => <g transform={`translate(${x} ${y})`}>
  <ellipse cx="0" cy="-9" rx="13" ry="9" className={styles.oCream} />
  <circle cx="13" cy="-12" r="5" className={styles.oDark} />
  <path d="M-6 -1 V4 M6 -1 V4" className={styles.oLine} strokeWidth="2" />
</g>

const Scroll = ({ x, y, s = 1 }: { x: number; y: number; s?: number }) => <g transform={`translate(${x} ${y}) scale(${s})`}>
  <rect x="-34" y="-24" width="68" height="48" rx="6" className={styles.oParch} />
  <path d="M-22-10 H22 M-22 0 H22 M-22 10 H8" className={styles.oLine} strokeWidth="2" />
  <circle cx="22" cy="14" r="6" className={styles.oRed} />
</g>

const Lion = ({ x, y, flip }: { x: number; y: number; flip?: boolean }) => <g transform={`translate(${x} ${y}) scale(${flip ? -1 : 1} 1)`}>
  <ellipse cx="0" cy="-14" rx="22" ry="13" className={styles.oLion} />
  <circle cx="22" cy="-22" r="12" className={styles.oMane} />
  <circle cx="24" cy="-22" r="7" className={styles.oLion} />
  <path d="M-12-3 V4 M10-3 V4 M-22-18 Q-34-24-30-34" className={styles.oLine} strokeWidth="3" />
</g>

const Loaf = ({ x, y }: { x: number; y: number }) => <ellipse cx={x} cy={y} rx="15" ry="9" className={styles.oBread} />
const Fish = ({ x, y }: { x: number; y: number }) => <g transform={`translate(${x} ${y})`}>
  <path d="M-17 0 Q-2-12 14 0 Q-2 12-17 0Z M14 0 L24-8 V8Z" className={styles.oFish} />
  <circle cx="-9" cy="-2" r="1.6" className={styles.oLineFill} />
</g>
const Basket = ({ x, y, s = 1 }: { x: number; y: number; s?: number }) => <g transform={`translate(${x} ${y}) scale(${s})`}>
  <path d="M-18-16 H18 L14 0 H-14Z" className={styles.oWicker} />
  <path d="M-14-9 H14 M-9-16 L-7 0 M0-16 V0 M9-16 L7 0" className={styles.oLine} strokeWidth="1.2" />
  <ellipse cx="-6" cy="-18" rx="7" ry="4" className={styles.oBread} />
  <ellipse cx="6" cy="-18" rx="7" ry="4" className={styles.oBread} />
</g>

const Water = ({ y = 314 }: { y?: number }) => <g aria-hidden="true">
  <path d={`M0 ${y} Q150 ${y - 23} 300 ${y} T600 ${y} V390 H0Z`} className={styles.oWater} />
  <path d={`M30 ${y + 24} Q75 ${y + 14} 120 ${y + 24} M380 ${y + 40} Q440 ${y + 28} 500 ${y + 40}`} className={styles.oFoam} />
</g>

/** Offsets applied while a story-state flag is off (`from`) and on (`to`); unspecified values stay at rest. */
type Pose = { x?: number; y?: number; s?: number; r?: string; o?: number }
const poseVars = (pose: Pose, key: '0' | '1') => ({
  [`--x${key}`]: `${pose.x ?? 0}px`,
  [`--y${key}`]: `${pose.y ?? 0}px`,
  [`--s${key}`]: `${pose.s ?? 1}`,
  [`--r${key}`]: pose.r ?? '0deg',
  [`--o${key}`]: `${pose.o ?? 1}`,
})

/** State-driven transition; reduced motion removes the transition but keeps the final pose. */
function Move({ name, on, from = {}, to = {}, delay = 0, origin, children }: {
  name: string; on: boolean; from?: Pose; to?: Pose; delay?: number; origin?: string; children: ReactNode
}) {
  const style = { ...poseVars(from, '0'), ...poseVars(to, '1'), '--d': `${delay}s`, ...(origin ? { '--origin': origin } : {}) } as CSSProperties
  return <g className={styles.move} data-move={name} data-on={on} style={style}>{children}</g>
}

const seen = (kit: HotspotKit, id: string) => kit.stateOf(id) === 'selected'
const right = (kit: HotspotKit, id: string) => kit.stateOf(id) === 'correct'
const wrong = (kit: HotspotKit, id: string) => kit.stateOf(id) === 'incorrect'

// ---------------------------------------------------------------- Noah
const ArkHull = () => <>
  <path d="M146 250 H455 L417 318 H188Z" className={styles.oWood} />
  <path d="M160 270 H441 M174 292 H430" className={styles.oLine} strokeWidth="1.5" />
</>

function ArkCabin({ dark = false }: { dark?: boolean }) {
  return <>
    <path d="M193 247 V200 H398 V247Z" className={styles.oWoodLight} />
    <path d="M203 200 L300 160 L388 200Z" className={styles.oRoof} />
    <rect x="282" y="214" width="34" height="33" rx="3" className={dark ? styles.oDark : styles.oWood} />
    <path d="M222 215 h24 v18 h-24Z M350 215 h24 v18 h-24Z" className={styles.oDark} />
  </>
}

const Animal = ({ x, y, tall }: { x: number; y: number; tall?: boolean }) => <g transform={`translate(${x} ${y})`}>
  <ellipse cx="0" cy="-12" rx="14" ry="8" className={styles.oLion} />
  <path d={tall ? 'M10-14 L16-38 M16-38 h6' : 'M12-14 l8-5'} className={styles.oLine} strokeWidth="4" />
  <path d="M-8-5 V3 M7-5 V3" className={styles.oLine} strokeWidth="3" />
</g>

const BANDS: Array<[string, number]> = [['var(--color-burgundy)', 160], ['var(--color-gold-bright)', 148], ['var(--color-success)', 136], ['var(--color-sky)', 124], ['var(--color-sky-deep)', 112]]
const bandPath = (r: number) => `M${300 - r} 215 A${r} ${r} 0 0 1 ${300 + r} 215`

function ArkObjects({ kit }: { kit: HotspotKit }) {
  const scene = kit.scene
  const covenant = right(kit, 'rainbow')
  return <>
    <Water />
    {scene === 0 && <>
      <Hotspot kit={kit} id="ship" hit={[[140, 150, 320, 175]]}>
        <ArkHull />
        <Move name="cabin" on={seen(kit, 'ship')} from={{ y: 34, o: 0 }}><ArkCabin /></Move>
      </Hotspot>
      <Hotspot kit={kit} id="food" hit={[[470, 255, 115, 100]]}>
        <Move name="supplies" on={seen(kit, 'food')} to={{ x: -112, y: -60, s: 0.55, o: 0 }}>
          <path d="M486 345 Q480 304 505 299 Q528 304 524 345Z M530 348 Q528 320 548 316 Q568 320 566 348Z" className={styles.oSack} />
          <path d="M498 300 Q505 292 514 300 M538 317 Q548 309 558 317" className={styles.oLine} strokeWidth="2" />
          <path d="M500 276 V296 M508 272 V296 M516 276 V296" className={styles.oLine} strokeWidth="2" />
        </Move>
      </Hotspot>
      <Move name="loaded" on={seen(kit, 'food')} from={{ o: 0, y: 14 }}>
        <path d="M388 250 Q384 230 402 227 Q420 230 416 250Z M418 252 Q416 236 430 234 Q444 237 440 252Z" className={styles.oSack} />
      </Move>
    </>}
    {scene === 1 && <>
      <ArkHull /><ArkCabin dark />
      <Move name="door" on={right(kit, 'lord')} from={{ o: 0 }}>
        <rect x="282" y="214" width="34" height="33" rx="3" className={styles.oWood} />
        <path d="M299 214 V247" className={styles.oLine} strokeWidth="1.5" />
      </Move>
      <Move name="animals" on={right(kit, 'lord')} to={{ x: 62, y: -96, s: 0.5, o: 0 }}><Animal x={225} y={335} /><Animal x={262} y={338} tall /></Move>
      <Move name="noah" on={right(kit, 'lord')} to={{ x: -48, y: -96, s: 0.5, o: 0 }}><Person x={345} y={340} s={0.9} robe="oRed" /></Move>
    </>}
    {scene === 2 && <>
      <ArkHull /><ArkCabin />
      <Hotspot kit={kit} id="rainbow" hit={[[130, 50, 340, 100]]}>
        {BANDS.map(([stroke, r]) => <path key={`g${r}`} d={bandPath(r)} fill="none" stroke={stroke} strokeWidth="11" opacity=".16" />)}
        {BANDS.map(([stroke, r], i) => <path key={r} data-move={`band${i}`} data-on={covenant} className={styles.drawn} pathLength="1" style={{ '--d': `${i * 0.25}s` } as CSSProperties} d={bandPath(r)} fill="none" stroke={stroke} strokeWidth="11" opacity=".9" />)}
      </Hotspot>
    </>}
  </>
}

// ---------------------------------------------------------------- David
function ValleyObjects({ kit }: { kit: HotspotKit }) {
  const scene = kit.scene
  const stones = right(kit, 'stones')
  const struck = right(kit, 'lord')
  return <>
    <g aria-hidden="true">
      <path d="M0 311 Q123 238 230 262 T420 250 T600 270 V390 H0Z" className={styles.oRock} opacity=".55" />
      <path d="M0 352 Q150 336 300 352 T600 346 V390 H0Z" className={styles.oGrass} />
    </g>
    {scene === 0 && <>
      <Hotspot kit={kit} id="flock" hit={[[60, 205, 185, 120]]}>
        <Move name="david" on={seen(kit, 'saul')} to={{ x: 70 }}>
          <Person x={130} y={310} s={1.6} robe="oBlue" />
          <path d="M168 305 L176 232" className={styles.oStaff} />
          <Move name="sheep" on={seen(kit, 'flock')} from={{ x: 26, o: 0 }}><Sheep x={200} y={312} /><Sheep x={232} y={322} /></Move>
        </Move>
      </Hotspot>
      <Hotspot kit={kit} id="saul" hit={[[370, 190, 150, 135]]}>
        <Person x={445} y={315} s={1.75} robe="oRed" crown />
        <Move name="blessing" on={seen(kit, 'saul')} from={{ x: 18, o: 0 }}><path d="M415 268 Q388 258 366 276" className={styles.oArm} /><path d="M358 262 l-10 -8 M356 276 l-14 0" className={styles.oLine} strokeWidth="3" /></Move>
      </Hotspot>
    </>}
    {scene === 1 && <>
      <Person x={115} y={345} s={1.5} robe="oBlue" />
      <path d="M150 348 L158 262" className={styles.oStaff} />
      <Move name="pouch" on={stones} from={{ o: 0, s: 0.4 }}><path d="M160 336 q12 -14 24 0 v16 q-12 8 -24 0Z" className={styles.oSack} /></Move>
      <path d="M200 340 Q300 372 400 340" className={styles.oBrook} />
      <Hotspot kit={kit} id="stones" hit={[[215, 295, 170, 90]]}>
        <Move name="stones" on={stones} to={{ x: -140, y: -22, s: 0.5, o: 0 }}>
          {[[245, 352], [275, 360], [305, 354], [335, 361], [365, 353]].map(([cx, cy]) => <ellipse key={cx} cx={cx} cy={cy} rx="13" ry="9" className={styles.oStone} />)}
        </Move>
      </Hotspot>
      <Hotspot kit={kit} id="helmet" hit={[[405, 290, 90, 90]]}>
        <Move name="helmet" on={wrong(kit, 'helmet')} to={{ r: '-18deg', y: 6 }}><Move name="helmetAside" on={stones} to={{ o: 0.35 }}>
          <path d="M418 350 Q420 308 450 306 Q480 308 482 350Z" className={styles.oBrass} />
          <path d="M418 350 H482 M450 306 V292" className={styles.oLine} strokeWidth="3" />
        </Move></Move>
      </Hotspot>
      <Hotspot kit={kit} id="sword" hit={[[500, 285, 85, 95]]}>
        <Move name="sword" on={wrong(kit, 'sword')} to={{ r: '24deg', y: 6 }}><Move name="swordAside" on={stones} to={{ o: 0.35 }}>
          <path d="M542 292 L552 344 L542 352 L532 344Z" className={styles.oSteel} />
          <path d="M522 346 H562 M542 350 V374" className={styles.oLine} strokeWidth="5" />
        </Move></Move>
      </Hotspot>
    </>}
    {scene === 2 && <g aria-hidden="true">
      <Person x={150} y={350} s={1.3} robe="oBlue" />
      <Move name="sling" on={struck} to={{ r: '720deg' }} origin="100% 100%"><path d="M172 318 q-22 -18 -2 -44" className={styles.oLine} strokeWidth="2" /></Move>
      <Move name="stone" on={struck} to={{ x: 262, y: -80, o: 0 }}><ellipse cx="176" cy="316" rx="6" ry="5" className={styles.oStone} /></Move>
      <Move name="goliath" on={struck} to={{ r: '-90deg' }} delay={0.9} origin="50% 100%">
        <Person x={450} y={352} s={2.9} robe="oDark" />
        <path d="M464 224 q18 -4 32 6" className={styles.oLine} strokeWidth="4" />
      </Move>
    </g>}
  </>
}

// ---------------------------------------------------------------- Daniel
function DenBase({ cave = true }: { cave?: boolean }) {
  return <g aria-hidden="true">
    <path d="M0 338 H600 V390 H0Z" className={styles.oGrass} />
    <path d="M110 338 Q122 148 300 138 Q478 148 490 338Z" className={styles.oRock} />
    {cave && <path d="M192 338 Q192 222 300 218 Q408 222 408 338Z" className={styles.oDark} />}
  </g>
}

function DenObjects({ kit }: { kit: HotspotKit }) {
  const scene = kit.scene
  const prayed = seen(kit, 'prayer')
  const angel = right(kit, 'angel')
  const sent = right(kit, 'letter')
  return <>
    <DenBase cave={scene !== 0} />
    {scene === 0 && <>
      <Hotspot kit={kit} id="decree" hit={[[115, 225, 135, 120]]}>
        <Move name="decree" on={seen(kit, 'decree')} to={{ s: 1.18 }}><Scroll x={182} y={288} s={1.5} /></Move>
      </Hotspot>
      <Hotspot kit={kit} id="prayer" hit={[[345, 215, 145, 135]]}>
        <rect x="358" y="232" width="52" height="68" rx="26" className={styles.oWindow} />
        <Move name="windowLight" on={prayed} from={{ o: 0 }}><ellipse cx="384" cy="266" rx="36" ry="44" className={styles.oGlow} /></Move>
        {[0, 1, 2].map((i) => <Move key={i} name={`prayer${i}`} on={prayed} from={{ o: 0, s: 0.2 }} delay={i * 0.5}><circle cx={372 + i * 12} cy="252" r="4.5" className={styles.oGold} /></Move>)}
        <Person x={440} y={342} s={1.5} robe="oCream" />
        <Move name="hands" on={prayed} to={{ y: -5 }}><path d="M428 300 L420 270 M452 300 L460 270" className={styles.oArm} /></Move>
      </Hotspot>
    </>}
    {scene === 1 && <>
      <Move name="lionLeft" on={angel} from={{ x: 32, s: 1.06 }} to={{ y: 3, s: 0.94 }}><Lion x={226} y={336} /></Move>
      <Move name="lionRight" on={angel} from={{ x: -32, s: 1.06 }} to={{ y: 3, s: 0.94 }}><Lion x={374} y={336} flip /></Move>
      <Person x={300} y={338} s={1.45} robe="oBlue" />
      <Hotspot kit={kit} id="angel" hit={[[235, 45, 130, 115]]}>
        <Move name="angel" on={angel} from={{ y: -34, o: 0.2 }}>
          <path d="M300 112 Q250 76 238 108 Q262 112 290 128 M300 112 Q350 76 362 108 Q338 112 310 128" className={styles.oWing} />
          <path d="M290 134 L294 96 Q300 90 306 96 L310 134Z" className={styles.oCream} />
          <circle cx="300" cy="84" r="9" className={styles.oSkin} />
          <circle cx="300" cy="82" r="16" className={styles.oHalo} />
        </Move>
      </Hotspot>
      <Hotspot kit={kit} id="stone" hit={[[100, 285, 95, 95]]}>
        <Move name="denStone" on={wrong(kit, 'stone')} to={{ x: -16, r: '-35deg' }}>
          <circle cx="147" cy="333" r="40" className={styles.oStone} />
          <path d="M122 322 Q140 310 156 322 M130 344 Q146 352 162 342" className={styles.oLine} strokeWidth="2" />
        </Move>
      </Hotspot>
    </>}
    {scene === 2 && <>
      <g aria-hidden="true"><Person x={305} y={340} s={1.45} robe="oBlue" /><Person x={140} y={342} s={1.5} robe="oRed" crown /></g>
      <Hotspot kit={kit} id="letter" hit={[[355, 235, 150, 125]]}>
        <Scroll x={430} y={300} s={1.7} />
        {[[-100, -86], [50, -118], [-30, -168]].map(([x, y], i) => <Move key={i} name={`copy${i}`} on={sent} from={{ o: 0 }} to={{ x, y }} delay={i * 0.3}><Scroll x={430} y={300} s={0.5} /></Move>)}
      </Hotspot>
    </>}
  </>
}

// ---------------------------------------------------------------- Feeding
function Crowd() {
  return <>
    <Person x={62} y={322} s={1.15} robe="oBlue" /><Person x={112} y={348} s={1.3} robe="oRed" />
    <Person x={163} y={320} s={1.1} robe="oCream" /><Person x={208} y={352} s={1.35} robe="oGoldRobe" />
    <Person x={92} y={376} s={1.1} robe="oCream" /><Person x={246} y={324} s={1.05} robe="oBlue" />
  </>
}

function BreadObjects({ kit }: { kit: HotspotKit }) {
  const scene = kit.scene
  const shared = right(kit, 'disciples')
  const leftovers = right(kit, 'twelve')
  return <>
    <g aria-hidden="true"><ellipse cx="300" cy="352" rx="330" ry="66" className={styles.oGrass} /></g>
    {scene === 0 && <Hotspot kit={kit} id="crowd" hit={[[25, 225, 245, 155]]}>
      <Move name="crowd" on={seen(kit, 'crowd')} to={{ x: 22 }}><Crowd /></Move>
    </Hotspot>}
    {scene === 1 && <Hotspot kit={kit} id="crowd" hit={[[25, 225, 245, 155]]}>
      <Crowd />
      <Move name="fed" on={shared} from={{ o: 0, s: 0.5 }} delay={1}>{[[82, 300], [150, 298], [205, 326], [244, 302]].map(([x, y]) => <Loaf key={x} x={x} y={y} />)}</Move>
    </Hotspot>}
    {scene === 0 && <Hotspot kit={kit} id="food" hit={[[300, 255, 210, 115]]}>
      <path d="M318 350 Q405 332 492 350 L482 366 Q405 352 328 366Z" className={styles.oCloth} />
      <Move name="food" on={seen(kit, 'food')} to={{ y: -12 }}>
        {[340, 372, 404, 436, 468].map((x, i) => <Loaf key={x} x={x} y={i % 2 ? 340 : 334} />)}
        <Fish x={366} y={312} /><Fish x={440} y={314} />
      </Move>
    </Hotspot>}
    {scene === 1 && <Hotspot kit={kit} id="disciples" hit={[[300, 235, 210, 145]]}>
      <Person x={350} y={338} s={1.5} robe="oBlue" /><Person x={440} y={352} s={1.6} robe="oRed" />
      <Basket x={400} y={340} s={1.1} />
      <Move name="bread" on={shared} to={{ x: -250, y: 30, s: 0.9 }}>
        {[[322, 296], [340, 304], [418, 292], [400, 302]].map(([x, y]) => <ellipse key={x} cx={x} cy={y} rx="12" ry="7" className={styles.oBread} />)}
      </Move>
    </Hotspot>}
    {scene === 2 && <Hotspot kit={kit} id="twelve" hit={[[140, 250, 320, 130]]}>
      {Array.from({ length: 12 }, (_, i) => <Move key={i} name={`basket${i}`} on={leftovers} from={{ o: 0.18, s: 0.5 }} delay={i * 0.1}><Basket x={170 + (i % 6) * 52} y={310 + Math.floor(i / 6) * 42} s={1.15} /></Move>)}
    </Hotspot>}
  </>
}

// ---------------------------------------------------------------- Storm
function StormObjects({ kit }: { kit: HotspotKit }) {
  const scene = kit.scene
  const waterId = scene === 0 ? 'waves' : scene === 1 ? 'wind' : 'calm'
  const rebuked = scene === 1 && right(kit, 'wind')
  const calmed = scene === 2 && right(kit, 'calm')
  const roughWaves = <>
    <path d="M20 330 Q60 296 100 330 T180 330 T260 330 T340 330 T420 330 T500 330 T580 330 M10 366 Q50 334 90 366 T170 366 T250 366 T330 366 T410 366 T490 366 T570 366" className={styles.oFoam} strokeWidth="5" />
  </>
  return <>
    <Water y={298} />
    {scene === 0 && <g aria-hidden="true"><path d="M100 110 L178 124 L142 171 M432 116 L510 130 L474 176" className={styles.oBolt} /></g>}
    {scene === 1 && <Move name="bolts" on={rebuked} to={{ o: 0 }}><g aria-hidden="true"><path d="M100 110 L178 124 L142 171 M432 116 L510 130 L474 176" className={styles.oBolt} /></g></Move>}
    <Hotspot kit={kit} id="boat" hit={[[150, 130, 300, 172]]}>
      <Move name="boat" on={scene === 0 ? seen(kit, 'boat') : rebuked || calmed} from={scene === 0 ? {} : { r: '-5deg' }} to={scene === 0 ? { r: '-6deg' } : {}} origin="50% 100%">
        <g transform="translate(0 -20)">
          <path d="M159 266 H451 L409 324 H202Z" className={styles.oWood} />
          <path d="M303 266 V161 L381 256 H303" className={styles.oSail} />
          <Person x={246} y={266} s={0.95} robe="oBlue" />
          <Person x={278} y={266} s={0.85} robe="oRed" />
          {scene === 0
            ? <Person x={412} y={262} s={1} robe="oCream" rotate={-82} halo />
            : <Person x={348} y={266} s={1.15} robe="oCream" halo />}
        </g>
      </Move>
    </Hotspot>
    <Hotspot kit={kit} id={waterId} hit={[[15, 302, 570, 84]]}>
      {scene === 0 && <Move name="waves" on={seen(kit, 'waves')} to={{ y: -22 }}>{roughWaves}</Move>}
      {scene === 1 && <>
        <Move name="waves" on={rebuked} to={{ y: 8, o: 0.55 }}>{roughWaves}</Move>
        <Move name="swirl" on={rebuked} to={{ o: 0 }}><path d="M40 232 Q100 214 160 232 M440 222 Q500 204 560 222" className={styles.oFoam} /></Move>
      </>}
      {scene === 2 && <>
        <Move name="rough" on={calmed} to={{ o: 0 }}>{roughWaves}</Move>
        <Move name="calmLines" on={calmed} from={{ o: 0 }}><path d="M20 328 H580 M60 352 H540 M20 374 H580" className={styles.oFoam} strokeWidth="4" /></Move>
      </>}
    </Hotspot>
  </>
}

export function StoryObjects({ kit }: { kit: HotspotKit }) {
  switch (kit.storyId) {
    case 'ark': return <ArkObjects kit={kit} />
    case 'david': return <ValleyObjects kit={kit} />
    case 'daniel': return <DenObjects kit={kit} />
    case 'feeding': return <BreadObjects kit={kit} />
    case 'storm': return <StormObjects kit={kit} />
    default: return null
  }
}
