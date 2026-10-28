/**
 * Editable PowerPoint export for "Present Mezmur".
 *
 * Every lyric slide is a real text box (selectable, editable, Unicode kept),
 * never a picture. The PptxGenJS library is imported lazily so it is not part
 * of the Mezmur page bundle.
 */
import type { PresentationSlide } from './presentationSlides'
import { themeColors, type PresentationTheme } from './presentationThemes'

export type PptxExportOptions = {
  slides: PresentationSlide[]
  title: string
  /** Presentation font size in px at a 1080px-tall stage. */
  fontSize: number
  theme: PresentationTheme
  highContrast?: boolean
  align: 'left' | 'center'
  attribution?: string | null
  includeAttribution?: boolean
}

// 16:9 widescreen (LAYOUT_WIDE): 13.333 × 7.5 in.
export const SLIDE_W = 13.333
export const SLIDE_H = 7.5
const MARGIN_X = 0.6
const LABEL_H = 0.45
const TEXT_TOP = 0.95
const TEXT_H = SLIDE_H - TEXT_TOP - 0.75
const TEXT_W = SLIDE_W - MARGIN_X * 2
const SECONDARY_SCALE = 0.72
const LINE_SPACING = 1.25

const ETHIOPIC = /[ሀ-፿ᎀ-᎟ⶀ-⷟꬀-꬯]/u
/** Fonts installed with Windows (Ebrima, Nyala) and macOS (Kefa) that cover Ethiopic. */
const ETHIOPIC_FONT = 'Ebrima'
const LATIN_FONT = 'Calibri'

/** Approximate rendered width of a string in em units. */
function emWidth(text: string): number {
  let w = 0
  for (const ch of text) {
    if (ETHIOPIC.test(ch)) w += 1.0
    else if (ch === ' ') w += 0.28
    else if (/[A-Z]/.test(ch)) w += 0.62
    else w += 0.52
  }
  return w
}

function wrappedLines(text: string, pt: number): number {
  const widthPt = emWidth(text) * pt
  return Math.max(1, Math.ceil(widthPt / (TEXT_W * 72 * 0.94)))
}

/** Height (pt) that a lyric slide needs at a given primary font size. */
export function estimateSlideHeightPt(slide: PresentationSlide, pt: number): number {
  let h = 0
  for (const line of slide.lines) {
    h += wrappedLines(line.text, pt) * pt * LINE_SPACING
    if (line.secondary) {
      const sp = pt * SECONDARY_SCALE
      h += wrappedLines(line.secondary, sp) * sp * LINE_SPACING + pt * 0.25
    }
  }
  return h
}

/** Largest font size ≤ requested that keeps the text inside the slide's text box. */
export function fitFontSizePt(slide: PresentationSlide, requestedPt: number, minPt = 14): number {
  const limit = TEXT_H * 72 * 0.92
  let pt = requestedPt
  while (pt > minPt && estimateSlideHeightPt(slide, pt) > limit) pt -= 1
  return Math.max(minPt, pt)
}

/** px at a 1080px-tall stage → pt on a 7.5in (540pt) slide. */
export function pxToPt(px: number): number {
  return Math.round((px * (SLIDE_H * 72)) / 1080)
}

function hex(color: string): string {
  return color.replace('#', '').toUpperCase()
}

function safeFileName(title: string): string {
  const base = title
    .normalize('NFKC')
    .replace(/[\\/:*?"<>|\p{Cc}]+/gu, ' ')
    .replace(/\s+/g, ' ')
    .trim()
    .slice(0, 80)
  return `${base || 'mezmur'}.pptx`
}

type PptxModule = typeof import('pptxgenjs')

export async function buildPptx(options: PptxExportOptions, load: () => Promise<PptxModule> = () => import('pptxgenjs')) {
  const mod = await load()
  const PptxGenJS = (mod as unknown as { default?: PptxModule['default'] }).default ?? (mod as unknown as PptxModule['default'])
  const pptx = new PptxGenJS()
  pptx.layout = 'LAYOUT_WIDE'
  pptx.title = options.title
  pptx.subject = 'Mezmur lyrics'
  pptx.company = 'Tewahedo Daily'

  const colors = themeColors(options.theme, Boolean(options.highContrast))
  const align = options.align === 'left' ? 'left' : 'center'
  const requestedPt = pxToPt(options.fontSize)
  const report: { slide: number; requestedPt: number; usedPt: number }[] = []

  options.slides.forEach((slide, index) => {
    const s = pptx.addSlide()
    s.background = { color: hex(colors.background) }

    if (slide.type === 'title') {
      const titleFont = slide.isEthiopic ? ETHIOPIC_FONT : LATIN_FONT
      s.addText(slide.title || options.title, {
        x: MARGIN_X, y: 2.0, w: TEXT_W, h: 1.9,
        fontFace: titleFont, fontSize: 48, bold: true, color: hex(colors.text),
        align: 'center', valign: 'middle', fit: 'shrink', lang: slide.isEthiopic ? 'am-ET' : 'en-US',
      })
      const sub = [slide.subtitle, slide.singer].filter(Boolean).join(' · ')
      if (sub) {
        s.addText(sub, {
          x: MARGIN_X, y: 4.05, w: TEXT_W, h: 0.9,
          fontFace: ETHIOPIC.test(sub) ? ETHIOPIC_FONT : LATIN_FONT, fontSize: 24, color: hex(colors.secondary),
          align: 'center', valign: 'top', fit: 'shrink',
        })
      }
      if (options.includeAttribution && options.attribution) {
        s.addText(`Source: ${options.attribution}`, {
          x: MARGIN_X, y: SLIDE_H - 0.75, w: TEXT_W, h: 0.4,
          fontFace: LATIN_FONT, fontSize: 12, color: hex(colors.secondary), align: 'center',
        })
      }
      return
    }

    if (slide.label) {
      s.addText(slide.label, {
        x: MARGIN_X, y: 0.35, w: TEXT_W, h: LABEL_H,
        fontFace: ETHIOPIC.test(slide.label) ? ETHIOPIC_FONT : LATIN_FONT, fontSize: 14, bold: true,
        color: hex(colors.accent), charSpacing: 2, align,
      })
    }

    const pt = fitFontSizePt(slide, requestedPt)
    report.push({ slide: index + 1, requestedPt, usedPt: pt })
    const primaryFont = slide.isEthiopic ? ETHIOPIC_FONT : LATIN_FONT
    const runs: { text: string; options: Record<string, unknown> }[] = []
    slide.lines.forEach((line, i) => {
      const last = i === slide.lines.length - 1
      runs.push({
        text: line.text,
        options: {
          fontFace: ETHIOPIC.test(line.text) ? ETHIOPIC_FONT : primaryFont,
          fontSize: pt, color: hex(colors.text), bold: true,
          breakLine: Boolean(line.secondary) || !last,
        },
      })
      if (line.secondary) {
        runs.push({
          text: line.secondary,
          options: {
            fontFace: LATIN_FONT, fontSize: Math.round(pt * SECONDARY_SCALE), italic: true,
            color: hex(colors.secondary), breakLine: !last, paraSpaceAfter: 6,
          },
        })
      }
    })
    s.addText(runs as never, {
      x: MARGIN_X, y: TEXT_TOP, w: TEXT_W, h: TEXT_H,
      align, valign: 'middle', lineSpacingMultiple: 1.1, fit: 'shrink', margin: 6,
    })

    if (options.includeAttribution && options.attribution && index === options.slides.length - 1) {
      s.addText(`Source: ${options.attribution}`, {
        x: MARGIN_X, y: SLIDE_H - 0.55, w: TEXT_W, h: 0.35,
        fontFace: LATIN_FONT, fontSize: 11, color: hex(colors.secondary), align: 'center',
      })
    }
  })

  return { pptx, fileName: safeFileName(options.title), report }
}

/** Builds the deck and triggers a browser download. */
export async function downloadPptx(options: PptxExportOptions): Promise<{ fileName: string }> {
  const { pptx, fileName } = await buildPptx(options)
  await pptx.writeFile({ fileName, compression: true })
  return { fileName }
}
