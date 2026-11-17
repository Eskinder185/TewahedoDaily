/**
 * Start the LOCAL Faith Challenges preview.
 *
 *   npm run preview:local          # this computer only:  http://127.0.0.1:5273/play
 *   npm run preview:local:lan      # also reachable from your phone on the same trusted home network
 *
 * Stop it with Ctrl+C in the terminal that is running it.
 *
 * What it does: rebuilds the git-ignored review inventory (offline, no credentials), then starts the normal Vite DEV server with
 * VITE_LOCAL_PREVIEW=true. The preview plays the bundled and generated banks, blocks every non-read request to the hosted Supabase
 * origin in the browser, and shows a LOCAL PREVIEW banner. It never builds, deploys, pushes or writes to any database.
 */
import { spawn, spawnSync } from 'node:child_process'
import { networkInterfaces } from 'node:os'

const lan = process.argv.includes('--lan')
const port = process.env.LOCAL_PREVIEW_PORT || '5273'
const host = lan ? '0.0.0.0' : '127.0.0.1'

// The preview must never carry hosted-admin credentials into the browser bundle or the dev server environment.
for (const name of Object.keys(process.env)) {
  if (/SERVICE_ROLE/i.test(name) && name.startsWith('VITE_')) { console.error(`Refusing to start: ${name} is a VITE_ variable and would be exposed to the browser.`); process.exit(1) }
}

const inventory = spawnSync(process.execPath, ['node_modules/tsx/dist/cli.mjs', 'scripts/play/build-local-review-inventory.ts'], { stdio: 'inherit' })
if (inventory.status !== 0) { console.error('Could not build the review inventory.'); process.exit(inventory.status ?? 1) }

// Private LAN addresses with their adapter names. Virtual adapters (WSL, Hyper-V, Docker, VPN, VirtualBox/VMware) are listed last
// because a phone cannot reach them; the real Wi-Fi or Ethernet address is the one to use.
const VIRTUAL = /vEthernet|WSL|Hyper-V|VirtualBox|VMware|Docker|Loopback|Bluetooth|TAP|TUN|VPN|Tailscale|ZeroTier|Default Switch/i
const candidates = Object.entries(networkInterfaces()).flatMap(([name, list]) => (list ?? [])
  .filter((entry) => entry.family === 'IPv4' && !entry.internal && /^(10\.|192\.168\.|172\.(1[6-9]|2\d|3[01])\.)/.test(entry.address))
  .map((entry) => ({ name, address: entry.address, virtual: VIRTUAL.test(name) || /^192\.168\.56\./.test(entry.address) }))) // 192.168.56.x is VirtualBox's default host-only range
  .sort((a, b) => Number(a.virtual) - Number(b.virtual))

console.log('\n  LOCAL PREVIEW (nothing is deployed or written to any hosted database)')
console.log(`  This computer : http://127.0.0.1:${port}/play`)
console.log(`  Draft review  : http://127.0.0.1:${port}/play/local-review`)
if (lan) {
  if (!candidates.length) console.log('  Your phone    : no private network address found; connect this computer to your home network first.')
  for (const [index, entry] of candidates.entries()) {
    const note = entry.virtual ? 'virtual adapter, your phone cannot reach this one' : index === 0 ? 'try this one first (same home network only)' : 'alternative adapter'
    console.log(`  ${index === 0 ? 'Your phone    :' : '               '} http://${entry.address}:${port}/play   [${entry.name}: ${note}]`)
  }
  console.log('  If the page does not open on the phone: allow *Private* networks when Windows Firewall asks, and use the first address above.')
  console.log('  Anyone on this network can open the preview while it runs. Stop it with Ctrl+C when you are done.')
}
console.log('  Stop          : press Ctrl+C\n')

const child = spawn(process.execPath, ['node_modules/vite/bin/vite.js', '--host', host, '--port', port, '--strictPort'], {
  stdio: 'inherit',
  env: { ...process.env, VITE_LOCAL_PREVIEW: 'true', VITE_PLAY_DATABASE_ONLY: 'false', NODE_ENV: 'development' },
})
const stop = () => { try { child.kill() } catch { /* already stopped */ } }
process.on('SIGINT', stop); process.on('SIGTERM', stop); process.on('exit', stop)
child.on('exit', (code) => process.exit(code ?? 0))
