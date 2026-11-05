/** Deliberately empty until reviewed relationships are separately approved for public use. */
export type ConfirmedMezmurFamily = {
  id: string
  approved: true
  sourceSha256: string
  approvedAt: string
  versions: readonly { slug: string; title: string; importId: string }[]
}

export const CONFIRMED_MEZMUR_FAMILIES: readonly ConfirmedMezmurFamily[] = []
