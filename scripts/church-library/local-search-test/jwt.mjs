import { createHmac } from 'node:crypto'
const b64 = (o) => Buffer.from(JSON.stringify(o)).toString('base64url')
export function jwt(role, secret = 'local-test-jwt-secret-0123456789abcdef0123') {
  const h = b64({ alg: 'HS256', typ: 'JWT' }); const p = b64({ role, iss: 'local', exp: 4102444800 })
  return `${h}.${p}.${createHmac('sha256', secret).update(`${h}.${p}`).digest('base64url')}`
}
if (process.argv[2]) console.log(jwt(process.argv[2]))
