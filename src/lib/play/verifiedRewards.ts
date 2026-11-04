/** Receipt validation is a client integrity check, not reward authorization.
 * The database derives identity, activity and score, and owns deduplication. */
export type RewardReceipt = {
  activity_id: string
  awarded: boolean
  xp_earned: number
  xp_total: number
}
export type RewardClient = {
  rpc: (name: string, args: Record<string, unknown>) => Promise<{ data: unknown; error: { message: string } | null }>
}
const UUID = /^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/i

export async function claimVerifiedRoomReward(client: RewardClient, roomId: string, participantId: string): Promise<RewardReceipt> {
  if (!UUID.test(roomId) || !UUID.test(participantId)) throw new Error('Invalid reward reference.')
  const { data, error } = await client.rpc('claim_verified_play_room_reward', {
    p_room_id: roomId, p_participant_id: participantId,
  })
  if (error) throw new Error('Verified reward is unavailable. No reward was confirmed; you can retry.')
  const r = data as Partial<RewardReceipt> | null
  if (!r || r.activity_id !== `game-night:${roomId.toLowerCase()}` || typeof r.awarded !== 'boolean'
    || !Number.isSafeInteger(r.xp_earned) || !Number.isSafeInteger(r.xp_total)
    || r.xp_total! < r.xp_earned! || r.xp_total! < 0
    || (r.awarded ? r.xp_earned! < 20 || r.xp_earned! > 100 : r.xp_earned !== 0)) {
    throw new Error('Invalid reward receipt. No reward was confirmed.')
  }
  // Never add a receipt delta to local XP: retries/tabs/devices can return it
  // more than once. Display the authoritative total separately from local XP.
  return r as RewardReceipt
}
