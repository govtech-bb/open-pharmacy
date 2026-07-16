# Open Pharmacy — Barbados SBS Pharmacy Finder

Helps people in Barbados find a pharmacy that accepts **Special Benefit Service (SBS)**
prescriptions — see what's open now, filter by parish or type, and get directions. It's the
interactive version of the Barbados Drug Service's printed SBS medication guide.

- **Live site:** https://govtech-bb.github.io/open-pharmacy
- **Status:** Alpha
- **Owner:** GovTech Barbados, with the Barbados Drug Service (BDS)

## The two pages

| Page | Purpose |
|------|---------|
| `index.html` | **Service guide** — who qualifies, what to bring, how to get medication, what you pay. |
| `find.html` | **Pharmacy directory** — opening hours, "open now" status, parish/type filters, and a map. |

## Tech

A static site — plain HTML, CSS and JavaScript, no build step or server. Uses the GOV.BB
design system (`dist/`), Leaflet for the map, and `comments.js` for page feedback.

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

Out-of-date hours, a closure, a new pharmacy, or a wrong map pin? Contact the Barbados Drug
Service:

- Phone: (246) 535-4300
- Email: management@drugservice.gov.bb

## Data source

Sourced from the Barbados Drug Service (drugservice.gov.bb) and the printed SBS guide,
verified May 2026. Hours and SBS participation change — pharmacies marked "SBS status not
confirmed" must be verified with BDS before relying on coverage.

---

© Government of Barbados. Built by GovTech Barbados.
