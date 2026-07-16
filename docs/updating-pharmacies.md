# Updating the pharmacy directory

All pharmacy information lives in **one place**: a JavaScript array called `PHARMACIES` near
the bottom of **`find.html`** (inside a `<script>` block). There is no database. To change a
phone number, fix opening hours, or add a pharmacy, you edit this array.

> **Tip for non-developers:** for small fixes, use the **pencil / edit icon** on `find.html`
> in GitHub rather than re-uploading the whole file. You'll see a line-by-line diff of exactly
> what changed before you commit — much harder to upload the wrong version by accident.

## What one pharmacy looks like

```js
{
  id: 'gov-2',                                   // unique id, never reuse
  name: 'Branford Taitt Polyclinic',
  type: 'government',                            // see "Types" below
  address: 'Black Rock Main Road, St. Michael',
  parish: 'St. Michael',                         // must match a parish in the filter dropdown
  phone: '(246) 536-3701',                       // '' if none — card then says "call BDS"
  hours: [
    { days: [1,2,3,4,5], open: 510, close: 990 } // Mon–Fri 8:30am–4:30pm
  ],
  hoursText: 'Mon–Fri 8:30am–4:30pm',            // the words shown on the card
  notes: '',                                     // optional note in a tinted box
  routes: 'Routes 11, 11A from Bridgetown Terminal' // optional bus routes
}
```

## Types

| `type` value | Meaning | Shown as |
|--------------|---------|----------|
| `government` | Government polyclinic — no dispensing fee for SBS beneficiaries | Blue border, "Government" badge |
| `private-sbs` | Confirmed Private Participating Pharmacy (PPP) — dispensing fee applies | Amber border, "Private Participating Pharmacy (PPP) · Dispensing fee" badge |
| `unconfirmed` | Registered pharmacy whose SBS participation is **not** confirmed | Grey border, "SBS status not confirmed" badge **plus a caution note** |

## How opening hours work

`hours` is a list of time slots. Each slot has:

- **`days`** — day numbers: `0` = Sunday, `1` = Monday … `6` = Saturday.
- **`open` / `close`** — **minutes since midnight**. So `8:30am` = `8 × 60 + 30` = `510`,
  `noon` = `720`, `4:30pm` = `990`, `8:00pm` = `1200`.

A pharmacy with different hours on different days has several slots:

```js
hours: [
  { days: [1],     open: 450, close: 1050 },  // Mon 7:30am–5:30pm
  { days: [2,3,5], open: 495, close: 990  },  // Tue, Wed, Fri 8:15am–4:30pm
  { days: [4],     open: 510, close: 990  }   // Thu 8:30am–4:30pm
]
```

> ⚠️ **Always update `hoursText` to match `hours`.** The site uses `hours` to calculate
> "open now", but shows `hoursText` to the reader. If they disagree, the public sees the
> wrong thing.

If hours are unknown, leave `hours: []`. The card then shows "Hours unconfirmed" and is
hidden when the "Open now only" filter is on, so no one is sent to a pharmacy on the wrong day.

"Open now" is calculated in **Barbados time (AST, UTC−4)** against the current day and slots.

## Map pins

Pin positions are kept in a separate `COORDS` object (also in `find.html`), keyed by the same
`id`:

```js
const COORDS = {
  'gov-2': [13.1002, -59.6310],   // [latitude, longitude]
  // …
};
```

A pharmacy with no `COORDS` entry doesn't appear on the map (it still appears in the list).

## Common tasks

**Change a phone number, address, or hours**
1. Open `find.html`, find the pharmacy by name.
2. Edit the field. For hours, change **both** `hours` (numbers) and `hoursText` (words).
3. Commit. The live site redeploys automatically.

**Add a pharmacy**
1. Copy an existing block of the right `type`.
2. Give it a new, unique `id`.
3. Fill in the fields. Add a matching `COORDS` entry if you have a location for the pin.

**Move a pin**
1. Find the pharmacy's `id` in `COORDS` and update the `[latitude, longitude]` pair.

**Change SBS status** (e.g. a pharmacy is confirmed as a PPP)
1. Change its `type` from `'unconfirmed'` to `'private-sbs'`, and add real `hours` if known.

## Getting latitude & longitude for a pin

1. Find the pharmacy on Google Maps.
2. Right-click the exact spot → click the numbers at the top (e.g. `13.1002, -59.6310`) to copy.
3. Paste as `[latitude, longitude]` into `COORDS`.
