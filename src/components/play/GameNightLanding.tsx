import { Link } from 'react-router-dom'
import { MIXED_CHALLENGE_GUIDE } from '../../lib/play/gameModes'
import styles from '../../pages/play/GameNightPage.module.css'

export function GameNightLanding({ am, onSelect }: { am: boolean; onSelect: (view: 'mixed' | 'host' | 'join') => void }) {
  return <section className={styles.choose} aria-label={am ? 'የምሽት ጨዋታ ይምረጡ' : 'Choose your Game Night'}>
    <article className={styles.feature}><p className={styles.badge}>{am ? 'የሚመከር · በአንድ ማያ ገጽ' : 'Recommended · shared screen'}</p>
      <h2>{am ? 'የተቀላቀለ ፈተና ምሽት' : 'Mixed Challenge Night'}</h2>
      <p>{am ? 'አምስት ዙሮች፣ አምስት የጨዋታ መንገዶች። ይህ መመሪያ የብዙ ተጫዋች ክፍል አይፈጥርም።' : 'Five rounds, five ways to play. This guide opens existing games; it does not create a multiplayer room.'}</p>
      <button type="button" onClick={() => onSelect('mixed')}>{am ? 'የምሽቱን መመሪያ ይክፈቱ' : 'Explore mixed challenge guide'} →</button>
    </article>
    <button type="button" onClick={() => onSelect('host')}><span aria-hidden="true">✦</span><strong>{am ? 'የራስዎን ምሽት ያዘጋጁ' : 'Custom Game Night'}</strong><small>{am ? 'ክፍል ይፍጠሩ · የመልስ ምርጫ ጥያቄዎች' : 'Host a room · answer-choice questions'}</small></button>
    <button type="button" onClick={() => onSelect('join')}><span aria-hidden="true">#</span><strong>{am ? 'በኮድ ይቀላቀሉ' : 'Join with a code'}</strong><small>{am ? 'ከስልክዎ ይመልሱ፤ እንግዶችም ይቀላቀላሉ።' : 'Join a room from your phone. Guests welcome.'}</small></button>
  </section>
}

export function MixedChallengeGuide({ am, onBack }: { am: boolean; onBack: () => void }) {
  return <section className={styles.panel} aria-labelledby="mixed-title">
    <button className={styles.back} type="button" aria-label={am ? 'ወደ ምርጫዎች ተመለስ' : 'Back to Game Night choices'} onClick={onBack}>←</button>
    <p className={styles.badge}>{am ? 'በአንድ ማያ ገጽ · እያንዳንዱ ጨዋታ ራሱን የቻለ ነው' : 'Shared-screen guide · independent games'}</p>
    <h2 id="mixed-title">{am ? 'የተቀላቀለ ፈተና ምሽት' : 'Mixed Challenge Night'}</h2>
    <p>{am ? 'በአንድ መሣሪያ አብረው ይጫወቱ። ከእያንዳንዱ ጨዋታ በኋላ በአሳሹ ወደ ኋላ ይመለሱ።' : 'Gather around one device. Open a round below, then use browser Back to return to this guide.'}</p>
    <ol className={styles.itinerary}>{MIXED_CHALLENGE_GUIDE.map(round => <li key={round.mode}><Link to={round.route}>{am ? round.am : round.en} →</Link></li>)}</ol>
    <Link to="/play/finish-the-mezmur">{am ? 'የቃላት ዙር አማራጭ · መዝሙሩን ይጨርሱ' : 'Word round alternative · Finish the Mezmur'} →</Link>
    <p className={styles.note}>{am ? 'የተቀላቀለ ክፍል፣ የጋራ ውጤትና የቡድን ውድድር ገና አይደገፉም።' : 'Mixed rooms, shared scores, teams, and cross-game content deduplication are not connected. Each game keeps its existing progress rules.'}</p>
  </section>
}
