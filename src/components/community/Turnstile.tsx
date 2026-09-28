import { useEffect, useRef, useState } from 'react'
type TurnstileApi = { render: (element: HTMLElement, options: Record<string, unknown>) => string; remove: (id: string) => void }
declare global { interface Window { turnstile?: TurnstileApi } }
let script: Promise<void> | undefined
function load() {
 if (window.turnstile) return Promise.resolve()
 if (script) return script
 script = new Promise<void>((resolve,reject) => {
  const element = document.createElement('script')
  element.src = 'https://challenges.cloudflare.com/turnstile/v0/api.js?render=explicit'
  element.async = true; element.defer = true
  element.onload = () => { if (window.turnstile) resolve(); else { element.remove(); script = undefined; reject(new Error('Verification did not initialize. Please retry.')) } }
  element.onerror = () => { element.remove(); script = undefined; reject(new Error('Verification could not load. Check your connection or content blocker.')) }
  document.head.appendChild(element)
 })
 return script
}
export function Turnstile({ onToken }: { onToken: (token: string) => void }) {
 const ref = useRef<HTMLDivElement>(null)
 const [error,setError] = useState('')
 const [attempt,setAttempt] = useState(0)
 useEffect(() => {
  let active = true; let widget: string | undefined
  void load().then(() => {
   if (!active || !ref.current || !window.turnstile) return
   widget = window.turnstile.render(ref.current, { sitekey: import.meta.env.VITE_TURNSTILE_SITE_KEY, action: 'community_submission', theme: 'auto', size: 'flexible', callback: (token: string) => { onToken(token); setError('') }, 'expired-callback': () => onToken(''), 'error-callback': () => { onToken(''); setError('Verification failed. Please retry.') } })
  }).catch((cause: Error) => { if (active) setError(cause.message) })
  return () => { active=false; if (widget) window.turnstile?.remove(widget) }
 }, [onToken,attempt])
 return <><div ref={ref} />{error && <p role="alert">{error} <button type="button" onClick={() => { onToken(''); setError(''); setAttempt(n=>n+1) }}>Retry verification</button></p>}</>
}
