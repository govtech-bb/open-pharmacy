# Pharmacy finder — content & copy style prototype

> ⚠️ **This prototype is to demonstrate content and copy style only.**
> **It is *not* intended to inform layout or visual design.**

It shows a possible **start page** for the pharmacy finder — the wording, the
order of information, and the plain-language style — so the content can be
reviewed on its own, separately from how the final page is laid out or styled.

## What this is

- A single self-contained page: [`index.html`](index.html).
- The start page plus simple placeholder "screens" for the three search routes
  (open / government / participating private pharmacies) and the support links.
  Navigation happens inside the one file, so every link works with no server.
- Built on the GOV.BB design system (loaded from the published CDN) so the copy
  is read in a realistic government-service context.

## What this is *not*

- Not a layout or visual-design proposal.
- Not connected to the live service data in [`find.html`](../../find.html).
- Not a replacement for the existing [`index.html`](../../index.html) service guide.

## How to view

Open `index.html` in a browser, or serve the folder:

```bash
python3 -m http.server 8000
# visit http://localhost:8000/prototypes/pharmacy-finder-content/
```
