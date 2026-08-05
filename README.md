# Open Pharmacy — Barbados pharmacy finder

Helps people in Barbados find a pharmacy that gives out **free or cheaper medication** — see
what's open now, filter by parish or type, and get directions. It's the interactive version of
the Barbados Drug Service's printed guide to the government subsidy (officially the Special
Benefit Service).

- **Live site:** https://govtech-bb.github.io/open-pharmacy
- **Status:** Alpha
- **Owner:** GovTech Barbados, with the Drug Service

## The two pages

| Page | Purpose |
|------|---------|
| `index.html` | **Service guide** — who qualifies, what to bring, how to get medication, what you pay. |
| `find.html` | **Pharmacy directory** — opening hours, "open now" status, parish/type filters, and a map. |

## Tech

A static site — plain HTML, CSS and JavaScript, no build step or server. It uses the GovBB
design system, Leaflet for the map, and `comments.js` for page feedback.

The design system is vendored, not built here:

| Path | What it is |
|------|------------|
| `dist/govbb.css` | Copy of `@govtech-bb/frontend` v1.0.0-alpha.20 (`packages/frontend/dist/govbb.css`). **Never edit.** |
| `assets/` | Copy of the design system's fonts and images — `govbb.css` loads the fonts from `../assets/fonts/`. |
| `app.css` | This project's own styles (measure, typographic rhythm, page shell). |

To take a new design-system release, re-copy both `dist/govbb.css` and `assets/` from
[govbb-design-system](https://github.com/govtech-bb/govbb-design-system) and check the
changelog for renamed classes.

## Run locally

No install needed. Serve the folder so the map and assets load correctly:

```bash
python3 -m http.server 8000
# visit http://localhost:8000
```

## Deploy

Published with **GitHub Pages** from the `main` branch (see `.github/workflows/`). Pushing or
merging to `main` redeploys the live site automatically, usually within a minute or two.
Enabling branch protection on `main` (*Settings → Branches*) is recommended since it's the
live branch.

## Where the data lives

All pharmacy information is a JavaScript array (`PHARMACIES`) inside **`find.html`** — there
is no database. To fix hours, change a phone number, add a pharmacy, or move a map pin, you
edit that file.

➡️ **See [`docs/updating-pharmacies.md`](docs/updating-pharmacies.md) for step-by-step instructions.**

## Report a change

Out-of-date hours, a closure, a new pharmacy, or a wrong map pin? Contact the Drug Service:

- Phone: (246) 535-4300
- Email: management@drugservice.gov.bb

## Data source

Sourced from the Drug Service (drugservice.gov.bb) and its printed guide, verified May 2026.
Hours and subsidy participation change — pharmacies marked "Private (no benefit)" must be
verified with the Drug Service before relying on coverage.

---

© Government of Barbados. Built by GovTech Barbados.
