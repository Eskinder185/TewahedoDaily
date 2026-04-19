import type { MezmurEntry } from '../../data/types/mezmur'
import type { WerbEntry } from '../../data/types/werb'

// Cache for loaded data to avoid re-loading
const loadedData = new Map<string, any>()

export async function loadAmharicChants(): Promise<MezmurEntry[]> {
  if (!loadedData.has('amharic')) {
    const module = await import('../../data/chants/amharic-chants.json')
    loadedData.set('amharic', module.default)
  }
  return loadedData.get('amharic')
}

export async function loadEnglishChants(): Promise<{ entries: MezmurEntry[] }> {
  if (!loadedData.has('english')) {
    const module = await import('../../data/chants/english-mezmur-chants.json')
    loadedData.set('english', module.default)
  }
  return loadedData.get('english')
}

export async function loadWerbChants(): Promise<WerbEntry[]> {
  if (!loadedData.has('werb')) {
    const module = await import('../../data/chants/werb.json')
    loadedData.set('werb', module.default)
  }
  return loadedData.get('werb')
}

// Preload specific types when needed
export async function loadMezmurData(): Promise<MezmurEntry[]> {
  const [amharic, english] = await Promise.all([
    loadAmharicChants(),
    loadEnglishChants()
  ])
  
  // Filter amharic chants to only mezmur entries (exclude werb type entries)
  const amharicMezmur = amharic.filter(entry => 
    !entry.type || entry.type === 'mezmur'
  )
  
  return [...amharicMezmur, ...english.entries]
}

export async function loadAllChantData(): Promise<{
  mezmur: MezmurEntry[]
  werb: WerbEntry[]
}> {
  const [mezmur, werb] = await Promise.all([
    loadMezmurData(),
    loadWerbChants()
  ])
  
  return { mezmur, werb }
}