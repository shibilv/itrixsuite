import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createServer } from 'node:http';

process.env.HOST = '0.0.0.0';
if (process.env.PORT === '8080') {
  console.warn('[itrix-hostinger] Ignoring local development PORT=8080; Hostinger should use its own runtime port or the 3000 fallback.');
  delete process.env.PORT;
}

const appRoot = dirname(fileURLToPath(import.meta.url));
const port = Number(process.env.PORT || 3000);
const host = process.env.HOST || '0.0.0.0';

process.on('uncaughtException', (error) => {
  console.error('[itrix-hostinger] uncaughtException:', error?.stack || error?.message || error);
});

process.on('unhandledRejection', (error) => {
  console.error('[itrix-hostinger] unhandledRejection:', error?.stack || error?.message || error);
});

try {
  process.chdir(join(appRoot, 'legacy-app'));
  await import('./legacy-app/serve-login.mjs');
} catch (error) {
  const message = error?.stack || error?.message || String(error);
  console.error('[itrix-hostinger] real app failed to start:', message);
  createServer((request, response) => {
    response.writeHead(500, { 'content-type': 'text/html; charset=utf-8' });
    response.end(`<!doctype html>
<html>
  <head><meta charset="utf-8"><title>ITRIX startup diagnostic</title></head>
  <body style="font-family:Arial,sans-serif;padding:24px;line-height:1.45">
    <h1>ITRIX startup diagnostic</h1>
    <p>The Hostinger Node runtime is working, but the ITRIX app failed before startup.</p>
    <h2>Safe environment check</h2>
    <ul>
      <li>NODE_ENV: ${process.env.NODE_ENV || '(empty)'}</li>
      <li>PORT: ${process.env.PORT || '(empty, using fallback 3000)'}</li>
      <li>ITRIX_DB_HOST: ${process.env.ITRIX_DB_HOST || '(empty)'}</li>
      <li>ITRIX_DB_NAME: ${process.env.ITRIX_DB_NAME || '(empty)'}</li>
      <li>ITRIX_DB_USER: ${process.env.ITRIX_DB_USER || '(empty)'}</li>
      <li>ITRIX_DB_PASSWORD: ${process.env.ITRIX_DB_PASSWORD ? 'set' : 'empty'}</li>
    </ul>
    <h2>Error</h2>
    <pre style="white-space:pre-wrap;background:#f3f4f6;padding:16px;border-radius:8px">${String(message).replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;')}</pre>
  </body>
</html>`);
  }).listen(port, host, () => {
    console.log(`[itrix-hostinger] diagnostic server running at http://${host}:${port}`);
  });
}
