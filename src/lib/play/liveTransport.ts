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

export function createRealtimeTransport(code: string, id: string): Transport | null {
  if (!supabase) return null
  const channel = supabase.channel(`fc-live-${code}`, { config: { broadcast: { self: false }, presence: { key: id } } })
  const messageHandlers: Array<(envelope: Envelope) => void> = []
  const presenceHandlers: Array<(ids: string[]) => void> = []
  channel.on('broadcast', { event: 'msg' }, ({ payload }) => { for (const handler of messageHandlers) handler(payload as Envelope) })
  channel.on('presence', { event: 'sync' }, () => { const ids = Object.keys(channel.presenceState()); for (const handler of presenceHandlers) handler(ids) })
  const ready = new Promise<void>((resolve, reject) => {
    const timer = window.setTimeout(() => reject(new Error('Could not reach the live-room service. Check your connection and try again.')), 15000)
    channel.subscribe(async (status) => {
      if (status === 'SUBSCRIBED') { await channel.track({ id }); window.clearTimeout(timer); resolve() }
      else if (status === 'CHANNEL_ERROR' || status === 'TIMED_OUT') { window.clearTimeout(timer); reject(new Error('Could not reach the live-room service. Check your connection and try again.')) }
    })
  })
  return {
    ready,
    send: (envelope) => { void channel.send({ type: 'broadcast', event: 'msg', payload: envelope }) },
    onMessage: (handler) => { messageHandlers.push(handler) },
    onPresence: (handler) => { presenceHandlers.push(handler) },
    close: () => { void channel.untrack(); void supabase!.removeChannel(channel) },
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
