export type PresentationTheme = 'navy' | 'dark' | 'gold' | 'ivory'

export type ThemeColors = {
  background: string
  text: string
  secondary: string
  accent: string
}

export const PRESENTATION_THEMES: Record<PresentationTheme, { labelEn: string; labelAm: string; colors: ThemeColors; contrast: ThemeColors }> = {
  navy: {
    labelEn: 'Navy',
    labelAm: 'ሰማያዊ',
    colors: { background: '#0D1B2A', text: '#F7F1E3', secondary: '#C9D6E6', accent: '#D8B45A' },
    contrast: { background: '#06101A', text: '#FFFFFF', secondary: '#FFFFFF', accent: '#FFD873' },
  },
  dark: {
    labelEn: 'Dark',
    labelAm: 'ጨለማ',
    colors: { background: '#06111D', text: '#FFFFFF', secondary: '#D7DFEB', accent: '#E8C37D' },
    contrast: { background: '#000000', text: '#FFFFFF', secondary: '#FFFFFF', accent: '#FFE08A' },
  },
  gold: {
    labelEn: 'Gold',
    labelAm: 'ወርቃማ',
    colors: { background: '#251C0E', text: '#FDEDC7', secondary: '#E9D3A1', accent: '#E5B95F' },
    contrast: { background: '#140E04', text: '#FFF6DE', secondary: '#FFF6DE', accent: '#FFD06B' },
  },
  ivory: {
    labelEn: 'Ivory',
    labelAm: 'ዝሆን ጥርስ',
    colors: { background: '#FBF6EA', text: '#1F1A16', secondary: '#4A3F36', accent: '#7A2E3A' },
    contrast: { background: '#FFFFFF', text: '#000000', secondary: '#1A1A1A', accent: '#5C0F1F' },
  },
}

export function themeColors(theme: PresentationTheme, highContrast: boolean): ThemeColors {
  const entry = PRESENTATION_THEMES[theme] || PRESENTATION_THEMES.navy
  return highContrast ? entry.contrast : entry.colors
}
