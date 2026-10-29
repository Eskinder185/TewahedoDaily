import g from './PlayGames.module.css'

/** A short burst of gold confetti. Purely decorative; hidden for reduced motion. */
export function Celebration() {
  return (
    <div className={g.confetti} aria-hidden="true">
      {Array.from({ length: 28 }, (_, i) => (
        <i key={i} style={{ ['--x' as string]: `${(i * 37) % 100}%`, ['--d' as string]: `${(i % 7) * 60}ms`, ['--r' as string]: `${(i * 53) % 360}deg`, ['--c' as string]: i % 3 === 0 ? '#c9a14a' : i % 3 === 1 ? '#7a3f3f' : '#e9d9ad' }} />
      ))}
    </div>
  )
}
