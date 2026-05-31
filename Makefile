.PHONY: dev build lint test migrate seed docker-up docker-down setup

# ─── Dev ───────────────────────────────────────────
dev:
	npm run dev

build:
	npm run build

lint:
	npm run lint && npx tsc --noEmit

# ─── Docker ────────────────────────────────────────
docker-up:
	docker compose up -d

docker-down:
	docker compose down

# ─── Database ──────────────────────────────────────
migrate:
	npx prisma migrate dev

migrate-deploy:
	npx prisma migrate deploy

seed:
	npx prisma db seed

studio:
	npx prisma studio

# ─── Setup ─────────────────────────────────────────
setup:
	npm install
	cp -n .env.example .env.local || true
	docker compose up -d
	npx prisma migrate dev