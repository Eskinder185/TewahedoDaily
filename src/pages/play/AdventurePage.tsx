import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { useLocale } from '../../lib/i18n/locale'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import styles from './AdventurePage.module.css'

type Scene = 0 | 1 | 2

export function AdventurePage() {
  const { locale } = useLocale()
  const { user } = useAuth()
  const [scene, setScene] = useState<Scene>(0)
  const [found, setFound] = useState<string[]>([])
  const [answer, setAnswer] = useState('')
  const [complete, setComplete] = useState(false)
  const am = locale === 'am'
  const discover = (key: string) => setFound((items) => items.includes(key) ? items : [...items, key])
  const finish = () => {
    setComplete(true)
    const saved = recordPlayCompletion({ game: 'adventure', score: 3, maxScore: 3, category: 'Exodus 14' })
    void syncPlayCompletion(user, { game: 'adventure', score: 3, maxScore: 3, category: 'Exodus 14', progress: saved.progress }).catch(() => undefined)
  }

  return <div className={styles.page} lang={locale}>
    <header className={styles.header}><Link to="/play">← {am ? 'ወደ ጨዋታ' : 'Tewahedo Play'}</Link><p>{am ? 'የመጽሐፍ ቅዱስ ጀብዱ' : 'Bible Adventure'}</p><h1>{am ? 'በባሕር ዳር ያለው መንገድ' : 'A Way Through the Sea'}</h1><span>{am ? 'በዘፀአት 14 ላይ የተመሠረተ' : 'A short 2D learning journey based on Exodus 14'}</span></header>
    <main className={styles.stage}>
      <p className={styles.notice}>{am ? 'የጨዋታ ምልክቶች ለመማር ብቻ ናቸው፤ ታሪኩ ከታች ከተጠቀሰው ቅዱስ መጽሐፍ የተወሰደ ነው።' : 'Interactive objects are learning aids, not additions to Scripture. The narrative is limited to the cited biblical passage.'}</p>
      <div className={styles.map} aria-label={am ? 'የምዕራፍ እድገት' : 'Chapter progress'}>{[0,1,2].map((item) => <span key={item} className={scene >= item ? styles.done : ''}>{item + 1}</span>)}</div>

      {scene === 0 ? <section className={styles.scene}>
        <div className={`${styles.illustration} ${styles.camp}`} role="img" aria-label={am ? 'ሕዝቡ በባሕር ዳር' : 'The people encamped by the sea'}><i className={styles.mountain}/><i className={styles.tent}/><i className={styles.sea}/><span className={styles.figure}>♙</span></div>
        <div className={styles.story}><p className={styles.eyebrow}>{am ? 'ትዕይንት 1 · በባሕር ዳር' : 'Scene 1 · By the sea'}</p><h2>{am ? 'ሕዝቡ ፈሩ' : 'The people were afraid'}</h2><p>{am ? 'እስራኤላውያን ፈርዖንና ሠራዊቱ ሲቀርቡ አዩ። ሙሴ እንዳይፈሩና የእግዚአብሔርን ማዳን እንዲያዩ ነገራቸው።' : 'The Israelites saw Pharaoh and his army approaching. Moses told the people not to be afraid and to see the deliverance of the Lord.'}</p><div className={styles.objects}><button type="button" onClick={() => discover('camp')}>⛺ {am ? 'ሰፈሩን ይመርምሩ' : 'Inspect the camp'}</button><button type="button" onClick={() => discover('sea')}>≈ {am ? 'ባሕሩን ይመልከቱ' : 'Look at the sea'}</button></div>{found.includes('camp') && found.includes('sea') ? <button className={styles.primary} type="button" onClick={() => setScene(1)}>{am ? 'ወደ ትምህርት ነጥብ' : 'Continue to checkpoint'} →</button> : <small>{am ? 'ለመቀጠል ሁለቱንም ይመርምሩ።' : 'Explore both objects to continue.'}</small>}<Link to="/bible/exodus/14">{am ? 'ምንጭ፦ ዘፀአት 14፥10–14' : 'Source: Exodus 14:10–14'}</Link></div>
      </section> : null}

      {scene === 1 ? <section className={styles.scene}><div className={`${styles.illustration} ${styles.wind}`} role="img" aria-label={am ? 'ባሕሩ ተከፈለ' : 'The sea divided'}><i className={styles.waveLeft}/><i className={styles.path}/><i className={styles.waveRight}/><span className={styles.figure}>♙</span></div><div className={styles.story}><p className={styles.eyebrow}>{am ? 'ትዕይንት 2 · የትምህርት ነጥብ' : 'Scene 2 · Learning checkpoint'}</p><h2>{am ? 'ሙሴ በባሕሩ ላይ ምን አደረገ?' : 'What did Moses do over the sea?'}</h2><div className={styles.answers}>{[['staff', am ? 'እጁን ዘረጋ' : 'He stretched out his hand'],['boat', am ? 'መርከብ ሠራ' : 'He built a ship'],['stone', am ? 'ድንጋይ ወረወረ' : 'He threw a stone']].map(([key,label]) => <button key={key} type="button" aria-pressed={answer === key} onClick={() => setAnswer(key)}>{label}</button>)}</div>{answer ? <div className={answer === 'staff' ? styles.correct : styles.incorrect} role="status">{answer === 'staff' ? (am ? 'ትክክል። እጁን ዘረጋ፤ እግዚአብሔርም ባሕሩን በኃይለኛ ነፋስ መለሰ።' : 'Correct. He stretched out his hand; the Lord drove back the sea with a strong wind.') : (am ? 'ጥቅሱን እንደገና ይመልከቱ።' : 'Look again at the cited verse.')}</div> : null}{answer === 'staff' ? <button className={styles.primary} type="button" onClick={() => setScene(2)}>{am ? 'በመንገዱ ይቀጥሉ' : 'Follow the path'} →</button> : null}<Link to="/bible/exodus/14">{am ? 'ምንጭ፦ ዘፀአት 14፥21–22' : 'Source: Exodus 14:21–22'}</Link></div></section> : null}

      {scene === 2 ? <section className={styles.scene}><div className={`${styles.illustration} ${styles.dawn}`} role="img" aria-label={am ? 'በሌላኛው ዳር ማለዳ' : 'Morning on the other shore'}><i className={styles.sun}/><i className={styles.shore}/><span className={styles.people}>♙ ♙ ♙</span></div><div className={styles.story}><p className={styles.eyebrow}>{am ? 'ትዕይንት 3 · ሌላኛው ዳር' : 'Scene 3 · The other shore'}</p><h2>{am ? 'ሕዝቡ ማዳኑን አየ' : 'The people saw the deliverance'}</h2><p>{am ? 'እስራኤል እግዚአብሔር ያደረገውን ታላቅ ሥራ አየ፤ ሕዝቡም እግዚአብሔርን ፈራ በእርሱና በባሪያው በሙሴም አመነ።' : 'Israel saw the great work the Lord had done. The people feared the Lord and believed in the Lord and in Moses his servant.'}</p>{complete ? <div className={styles.complete} role="status"><span>✦</span><h3>{am ? 'ምዕራፉ ተጠናቋል' : 'Chapter complete'}</h3><p>+100 XP</p><Link to="/play">{am ? 'ወደ ጨዋታ ማዕከል' : 'Return to game center'}</Link></div> : <button className={styles.primary} type="button" onClick={finish}>{am ? 'ምዕራፉን ያጠናቅቁ' : 'Complete chapter'}</button>}<Link to="/bible/exodus/14">{am ? 'ምንጭ፦ ዘፀአት 14፥30–31' : 'Source: Exodus 14:30–31'}</Link></div></section> : null}
    </main>
  </div>
}
