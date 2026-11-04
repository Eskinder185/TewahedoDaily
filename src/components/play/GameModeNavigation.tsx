import { Link } from 'react-router-dom'
import { GAME_MODES } from '../../lib/play/gameModes'
import styles from './GameModeNavigation.module.css'

/** Both CMS libraries point to the existing studio, not a separate content store. */
export function GameModeNavigation({ am, selected }: { am: boolean; selected?: string }) {
  return <nav className={styles.modes} aria-label={am ? 'የይዘት ጨዋታ ሁነታዎች' : 'Content game modes'}>
    <Link to="/admin/play/studio" aria-current={selected === 'all' ? 'page' : undefined}>{am ? 'ሁሉም 12 ጨዋታዎች' : 'All 12 games'}</Link>
    {GAME_MODES.map(mode => <Link key={mode.id} data-content-mode={mode.id} to={`/admin/play/studio?mode=${mode.id}`} aria-current={selected === mode.id ? 'page' : undefined}>
      <span aria-hidden="true">{mode.icon}</span> {am ? mode.am : mode.en}
    </Link>)}
  </nav>
}
