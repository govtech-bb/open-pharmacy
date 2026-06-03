-- =====================================================================
-- open-pharmacy review comments — Supabase table + access policies
-- ---------------------------------------------------------------------
-- Run this ONCE in your project's SQL editor:
--   Supabase dashboard > SQL Editor > New query > paste > Run.
-- Project: https://supabase.com/dashboard/project/xvyjgtdnuugcxpydvfzl
--
-- Column names are quoted to preserve camelCase, because the widget
-- sends JSON keys "pageId" and "createdAt" and PostgREST matches names
-- exactly. The anon role gets read/insert/update (no delete) — fine for
-- a private review link; don't advertise the page publicly.
-- =====================================================================

create table if not exists public.comments (
  id          text primary key,
  "pageId"    text not null,
  quote       text,
  prefix      text,
  suffix      text,
  author      text,
  text        text,
  "createdAt" bigint,
  resolved    boolean default false,
  replies     jsonb   default '[]'::jsonb
);

alter table public.comments enable row level security;

drop policy if exists "anon read"   on public.comments;
drop policy if exists "anon insert" on public.comments;
drop policy if exists "anon update" on public.comments;

create policy "anon read"   on public.comments for select to anon using (true);
create policy "anon insert" on public.comments for insert to anon with check (true);
create policy "anon update" on public.comments for update to anon using (true) with check (true);
