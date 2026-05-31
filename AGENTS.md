# Art Store — Agent Instructions

## Allowed Commands

- `npm run dev` — start dev server
- `npm run build` — production build
- `npm run lint` — ESLint
- `npx tsc --noEmit` — type check
- `npx prisma migrate dev` — run migrations (dev only)
- `npx prisma studio` — open DB GUI
- `make <target>` — see Makefile for all targets

## Do NOT Run

- `npx prisma migrate deploy` — production only, run in CI
- `npx prisma db push` — bypasses migration history
- Any `git push` to `main` or `staging` directly

## Project Structure

src/
├── app/ # Next.js routes and pages
├── components/ # React components
├── domain/ # Pure business logic (no imports from outside domain/)
├── services/ # Use-case orchestration
├── infrastructure/ # External service clients
└── lib/ # Shared utilities

## When Adding Features

1. Define/update Prisma schema first
2. Run migration
3. Define domain types and logic
4. Implement service layer
5. Wire up Route Handler
6. Build UI last
