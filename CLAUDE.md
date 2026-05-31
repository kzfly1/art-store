# Art Store — Claude Context

## Project Overview

Personal art e-commerce site built with Next.js 15 (App Router).
Sells original artworks (unique, sold-once) and print variants (SKU-based inventory).

## Stack

- **Framework**: Next.js 15 App Router, TypeScript strict mode
- **Styling**: Tailwind CSS + shadcn/ui
- **ORM**: Prisma + PostgreSQL
- **Payments**: Stripe Checkout + Webhooks
- **Image hosting**: Cloudinary
- **Auth**: NextAuth.js v5 (admin only)
- **Deploy**: Vercel (app) + Supabase (db)

## Architecture Rules

- `src/domain/` — pure business logic, zero framework/library imports
- `src/services/` — orchestration layer, calls domain + infrastructure
- `src/infrastructure/` — Prisma, Stripe, Cloudinary clients
- `src/app/api/` — HTTP layer only, no business logic here
- Route Handlers must validate input with Zod before touching services

## Key Domain Concepts

- **Artwork** has either an `OriginalListing`, a `PrintListing`, or both
- `OriginalListing` status: `Available → Reserved → Sold` (never delete)
- `PrintListing` has variants (size/paper) each with stock quantity
- **Order** status machine: `Pending → Paid → Shipped → Completed`
- Stock reservation expires after 15 minutes if unpaid

## Code Conventions

- Functional components only, no class components
- Server Components by default; add `"use client"` only when necessary
- All API responses typed with shared Zod schemas
- No `any` types — ever
- Errors handled explicitly, no silent catches
- Prefer named exports over default exports (except page/layout files)

## Branch Strategy

- `main` → Production
- `staging` → Staging
- `dev` → Development base
- `feature/*` → cut from dev, PR back to dev

## What NOT to do

- Never put business logic in Route Handlers
- Never import Prisma directly in components
- Never trust client-side payment callbacks — only Stripe webhooks
- Never commit `.env.local`
