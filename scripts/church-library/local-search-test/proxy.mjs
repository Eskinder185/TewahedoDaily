import http from 'node:http'
http.createServer((req, res) => {
  const path = req.url.replace(/^\/rest\/v1/, '') || '/'
  const up = http.request({ host: '127.0.0.1', port: 3999, path, method: req.method, headers: { ...req.headers, host: '127.0.0.1:3999' } }, (r) => { res.writeHead(r.statusCode, r.headers); r.pipe(res) })
  up.on('error', (e) => { res.writeHead(502); res.end(String(e)) }); req.pipe(up)
}).listen(54321)
