import { useState } from 'react'
import { supabase } from '../../lib/supabase/client'
import { claimVerifiedRoomReward, type RewardClient, type RewardReceipt } from '../../lib/play/verifiedRewards'

export function VerifiedRoomReward({ roomId, participantId, am }: { roomId: string; participantId: string; am: boolean }) {
  const [receipt, setReceipt] = useState<RewardReceipt | null>(null)
  const [busy, setBusy] = useState(false)
  const [failed, setFailed] = useState(false)
  async function claim() {
    if (!supabase || busy) return
    setBusy(true); setFailed(false)
    try { setReceipt(await claimVerifiedRoomReward(supabase as unknown as RewardClient, roomId, participantId)) }
    catch { setFailed(true) }
    finally { setBusy(false) }
  }
  return <section aria-label={am ? 'የተረጋገጠ XP' : 'Verified XP'}>
    {receipt ? <p role="status">{am ? 'የተረጋገጠ ጠቅላላ XP' : 'Verified total XP'}: {receipt.xp_total}</p>
      : <button type="button" disabled={busy} onClick={() => void claim()}>{am ? 'የጨዋታውን XP ያረጋግጡ' : 'Claim verified room XP'}</button>}
    {failed ? <p role="alert">{am ? 'XP አልተረጋገጠም። እንደገና ይሞክሩ።' : 'XP was not confirmed. The verified reward service may be unavailable, or this room may not qualify. You can retry.'}</p> : null}
  </section>
}
