import { createElement } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import { LocaleProvider } from '../../src/lib/i18n/locale'
import { DailyFaithDashboard } from '../../src/components/dailyFaith/DailyFaithDashboard'
import type { DayChurchContext } from '../../src/services/dayChurchContext'
import '../../src/styles/tokens.css'

const root = createRoot(document.getElementById('root')!)
export function renderCalendar(context: DayChurchContext) {
  root.render(createElement(BrowserRouter, null, createElement(LocaleProvider, null, createElement(DailyFaithDashboard, { context }))))
}
Object.assign(window, { renderCalendar })
