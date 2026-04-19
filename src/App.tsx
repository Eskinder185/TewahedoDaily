import { Routes, Route } from 'react-router-dom'
import { AppShell } from './components/layout/AppShell'
import { HomePage } from './pages/HomePage'
import { PracticePage } from './pages/PracticePage'
import { CalendarPage } from './pages/CalendarPage'
import { AboutPage } from './pages/AboutPage'
import { PrayersHubPage } from './pages/PrayersHubPage'
import { ZeweterTselotPage } from './pages/ZeweterTselotPage'
import { WudaseMariamPage } from './pages/WudaseMariamPage'
import { MezmureDawitPage } from './pages/MezmureDawitPage'
import { YekidaneTselotPage } from './pages/YekidaneTselotPage'
import { MehareneAbPage } from './pages/MehareneAbPage'

export default function App() {
  return (
    <Routes>
      <Route element={<AppShell />}>
        <Route path="/" element={<HomePage />} />
        <Route path="/practice" element={<PracticePage />} />
        <Route path="/calendar" element={<CalendarPage />} />
        <Route path="/about" element={<AboutPage />} />
        <Route path="/prayers" element={<PrayersHubPage />} />
        <Route path="/prayers/zeweter" element={<ZeweterTselotPage />} />
        <Route path="/prayers/wudase-mariam" element={<WudaseMariamPage />} />
        <Route path="/prayers/mezmure-dawit" element={<MezmureDawitPage />} />
        <Route path="/prayers/yekidane-tselot" element={<YekidaneTselotPage />} />
        <Route path="/prayers/meharene-ab" element={<MehareneAbPage />} />
      </Route>
    </Routes>
  )
}
