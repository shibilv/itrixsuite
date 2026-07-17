# ITRIX Repair Suite

Node.js + MySQL/MariaDB repair-center management app for Hostinger deployment.

## Hostinger settings

- Framework: `Express`
- Node version: `20.x`
- Entry file: `server.js`
- Package manager: `npm`
- Root directory: repository root

## Environment variables

Add these in Hostinger. Do not commit a real `.env` file.

```env
NODE_ENV=production
ITRIX_DB_HOST=localhost
ITRIX_DB_PORT=3306
ITRIX_DB_NAME=YOUR_FULL_HOSTINGER_DATABASE_NAME
ITRIX_DB_USER=YOUR_FULL_HOSTINGER_DATABASE_USER
ITRIX_DB_PASSWORD=YOUR_DATABASE_PASSWORD
ITRIX_ALLOW_FALLBACK_LOGINS=0
```

Important: do not set `PORT=8080` on Hostinger.

## Database

Import this SQL in Hostinger phpMyAdmin:

```text
database/itrix-final-clean-34000.sql
```

It is clean for new usage:

- Existing jobs: 0
- Next job number: 34000
- Users/staff/master settings preserved

## Login

```text
Username: ....
Password: ....
```

Change the password after first successful online login.
