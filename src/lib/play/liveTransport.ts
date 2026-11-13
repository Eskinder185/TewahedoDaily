/** Message transport for live rooms: Supabase Realtime broadcast (no database tables, no SQL). */
import { supabase } from '../supabase/client'
import type { HostMsg, PlayerMsg } from './liveRoom'

export type Envelope = { from: 'host'; body: HostMsg } | { from: 'player'; body: PlayerMsg }
export type Transport = {
  ready: Promise<void>
  send: (envelope: Envelope) => void
  onMessage: (handler: (envelope: Envelope) => void) => void
  /** Ids currently present in the room (players and the host key `host`). */
  onPresence: (handler: (ids: string[]) => void) => void
  close: () => void
}

type RealtimeClient = NonNullable<typeof supabase>
export type TransportOptions = { client?: RealtimeClient | null; readyTimeoutMs?: number }

/**
 * Two guarantees that keep a room healthy when its page re-runs the effect that owns the transport (React development
 * mode mounts effects twice; a language change re-runs them too):
 *
 * 1. A closed transport never reports an outage. Before this guard the abandoned transport's 15-second "could not
 *    reach the service" timer still fired and flipped a healthy room to Offline for the host and every player at once.
 * 2. The Realtime channel is created one tick after the transport, and not at all if it was closed in that tick. A
 *    channel that is joined and immediately left on the SAME topic can have its leave processed by the server after
 *    the replacement channel joined, which silently stops delivery to the replacement. Measured on the live service:
 *    broadcasts themselves were never lost (0 of 120) with a single, stable channel.
 */
export function createRealtimeTransport(code: string, id: string, options: TransportOptions = {}): Transport | null {
  const client = options.client === undefined ? supabase : options.client
  if (!client) return null
  const timeoutMs = options.readyTimeoutMs ?? 15000
  const unreachable = () => new Error('Could not reach the live-room service. Check your connection and try again.')
  const messageHandlers: Array<(envelope: Envelope) => void> = []
  const presenceHandlers: Array<(ids: string[]) => void> = []
  const pending: Envelope[] = []
  let channel: ReturnType<RealtimeClient['channel']> | null = null
  let connected = false
  let closed = false
  let timer: ReturnType<typeof setTimeout> | undefined
  let connectTimer: ReturnType<typeof setTimeout> | undefined
  const push = (envelope: Envelope) => { void channel?.send({ type: 'broadcast', event: 'msg', payload: envelope }) }

  const ready = new Promise<void>((resolve, reject) => {
    timer = setTimeout(() => { if (!closed) reject(unreachable()) }, timeoutMs)
    connectTimer = setTimeout(() => {
      if (closed) return
      const live = client.channel(`fc-live-${code}`, { config: { broadcast: { self: false }, presence: { key: id } } })
      channel = live
      live.on('broadcast', { event: 'msg' }, ({ payload }) => { if (!closed) for (const handler of messageHandlers) handler(payload as Envelope) })
      live.on('presence', { event: 'sync' }, () => { if (closed) return; const ids = Object.keys(live.presenceState()); for (const handler of presenceHandlers) handler(ids) })
      live.subscribe(async (status) => {
        if (closed) return
        if (status === 'SUBSCRIBED') {
          await live.track({ id }); clearTimeout(timer)
          if (closed) return
          connected = true
          for (const envelope of pending.splice(0)) push(envelope)
          resolve()
        } else if (status === 'CHANNEL_ERROR' || status === 'TIMED_OUT') { clearTimeout(timer); reject(unreachable()) }
      })
    }, 0)
  })
  return {
    ready,
    // Messages sent before the channel has joined wait and are delivered in order once it has.
    send: (envelope) => { if (closed) return; if (connected) push(envelope); else pending.push(envelope) },
    onMessage: (handler) => { messageHandlers.push(handler) },
    onPresence: (handler) => { presenceHandlers.push(handler) },
    close: () => {
      if (closed) return
      closed = true; clearTimeout(timer); clearTimeout(connectTimer); pending.length = 0
      if (channel) { void channel.untrack(); void client.removeChannel(channel) }
    },
  }
}

/** In-process hub with the same interface, for tests of two independent engines/clients. */
export function createMemoryHub() {
  const members = new Map<string, { onMessage: Array<(e: Envelope) => void>; onPresence: Array<(ids: string[]) => void> }>()
  const announce = () => { const ids = [...members.keys()]; for (const m of members.values()) for (const h of m.onPresence) h(ids) }
  return {
    connect(id: string): Transport {
      const me = { onMessage: [] as Array<(e: Envelope) => void>, onPresence: [] as Array<(ids: string[]) => void> }
      members.set(id, me); queueMicrotask(announce)
      return {
        ready: Promise.resolve(),
        send: (envelope) => { for (const [other, m] of members) if (other !== id) queueMicrotask(() => { for (const h of m.onMessage) h(structuredClone(envelope)) }) },
        onMessage: (h) => { me.onMessage.push(h) },
        onPresence: (h) => { me.onPresence.push(h) },
        close: () => { members.delete(id); queueMicrotask(announce) },
      }
    },
  }
}
