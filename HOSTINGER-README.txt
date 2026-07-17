ITRIX Repair Suite - Hostinger Upload Package

Upload folder:
ITRIX-Repair-Suite-Hostinger-Final

Database restore file:
database/itrix-hostinger-clean-34000.sql

This SQL file is clean for live/test start and sets the next job number to 34000.

Admin login:
Username: admin
Password: kannur134134

Required hosting:
- Node.js 20 or newer
- MySQL/MariaDB database
- Ability to set app environment variables or upload a .env file

Do not set PORT=8080 in Hostinger environment variables. That value is only for local Mac testing.
Let Hostinger provide the runtime port, or let this package use the Node hosting fallback.

Start command:
npm start

If Hostinger asks for an entry file, use one of these:
index.js
server.js
legacy-app/serve-login.mjs

Preferred:
index.js

Set environment variables in Hostinger's Environment Variables panel.

App URL after deployment:
https://YOURDOMAIN/welcome/index

Writable folders:
- legacy-app/uploads/
- legacy-app/uploads/job-photos/
- legacy-app/backups/

Important:
Do not upload old local MariaDB build folders, node_modules, saved-job-receipts, survival-backups, or development backups.
