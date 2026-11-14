# Restore backup (Neon PostgreSQL)

## Prerequisites

- PostgreSQL client tools installed (must include `pg_restore`).
- Valid Neon connection string (SSL required). Example:
  - `postgres://USER:PASSWORD@HOST.neon.tech/DB?sslmode=require`

## Recommended restore flow (safe)

1. Create a new Neon branch (recommended) and get its connection string.
2. Restore into that branch, then verify the application.
3. If OK, promote/switch connection string used by the app to the restored branch.

## Restore command (from a .zip produced by backup script)

1. Extract the `.zip` so you have a `.dump` file.
2. Run:

```bash
pg_restore --clean --if-exists --no-owner --no-acl --dbname "<DATABASE_URL>" "<PATH_TO_BACKUP.dump>"
```

Notes:
- `--clean --if-exists` will drop objects before recreating them.
- Prefer restoring into an empty DB / new branch to avoid surprises.

## Troubleshooting

- If SSL errors appear, ensure your URL includes `sslmode=require`.
- If permission errors appear, remove `--clean` and restore into a fresh branch.
