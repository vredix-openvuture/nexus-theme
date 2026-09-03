# Changelog

Grouped by what changed for you, not by commit. Newest first.

## 0.8.2 — 2026-09-03

### Fixed

- **Both sidebars were unreadable on mobile.** The view switcher at the top of a
  drawer, and the list it opens, are painted by Obsidian from
  `--interactive-normal` — and on mobile Obsidian re-declares that variable at a
  higher specificity than section 4 could reach, falling back to
  `--background-modifier-border`. A *border* colour used as a *surface*: ours is
  a translucent accent wash, so the panel came out 41 % opaque and red, with the
  page legible straight through it and a chip of its own colour sitting inside
  it. Three containers, one colour, no edge.

  The mobile variables are restated at a specificity that wins, and the switcher
  now gets the look every other menu here has: an opaque panel with a hairline
  and a real shadow, the row inside it that names the current view drawn as a
  heading instead of a second button, and one accent highlight on the row you
  are on. Verified against Obsidian's own `app.css` in headless Chromium, before
  and after.

## 0.8.1 — 2026-09-02

The token note points at this repo's own style guide. Nothing visual changed.

## 0.8.0 — 2026-09-02

### Changed

- **One file owns every shared number.** Radii, border width and colour, surface
  lifts, control height, field width and spacing are declared once, in a block
  that is identical in the theme and in the plugin. The two used to disagree —
  the theme said a 15px container radius, the plugin fell back to 12px and 10px
  — which is most of why the same element looked different depending on where it
  was drawn. Every literal `border-radius` in this file is gone; the only one
  left is `0`.
- **Two radii, and that is all.** `--nx-radius` for anything that contains
  something, `--nx-r-tile` for anything that is a control. A circle and a pill
  exist as shapes, used only where the shape means something.

### Changed

- **The two radii are 10px and 6px**, picked from four rendered variants. The
  theme said 15/10, but its own tablet and narrow-window blocks were already
  overriding the container radius to 10 — so this makes every device draw the
  same corner and deletes those two overrides rather than adding a third. A code
  block reads as a box again instead of a lozenge. The style variants that mean
  something by their corners — the Notion-like palette and "Almost nothing" —
  keep theirs.

### Fixed

- **Code blocks looked like separate strips glued together.** In Live Preview
  Obsidian puts `HyperMD-codeblock-bg` on every line of the block rather than on
  a wrapper, so a radius on it rounded all ten lines of a ten-line block
  individually and pinched the edge at every seam. The first and last lines now
  carry the corners and the middle carries none; a single-line block still
  rounds on all four. Multi-line quotes had exactly the same bug and the same
  fix.
- **The active file's background covered the explorer rail.** A full-bleed row
  highlight reaches past the folder's left edge; both insets are now pinned so
  it cannot.
- **A long folder list ran out of colour.** The rail's sweep normalised over
  seven positions, so from the eighth folder every rail was the same tone — and
  that tone was the darkest slot in the palette. The sweep now walks ten stops
  and turns around, repeating, so no folder is ever colourless. The cool end was
  also lifted so it stays blue instead of going near-black.
- Every remaining German comment translated.

## 0.7.1 — 2026-08-31

### Fixed

- **Dropdowns, menus and native controls kept Obsidian's own blue-violet.** The
  theme painted everything it drew itself, and left Obsidian's `--color-accent`
  untouched — so the panel of a menu was in the palette and the selected row in
  it was not, on every palette and in every style. Obsidian builds that accent
  from three numbers rather than a colour (`--accent-h/-s/-l`, default
  `258, 88%, 66%`); 41 of its own rules read `var(--color-accent)` and another
  24 read the raw components. All of them now come from the palette.

  Also derived from the palette instead of left to Obsidian: the interactive
  states, the checkbox, the toggle thumb, the slider, the form-field ground,
  the dropdown ground, the active nav item, the focused tab, links, the modal
  and prompt borders, the divider and the text selection.

- **The selected row of a menu and of a suggestion list** are now drawn by the
  theme outright rather than inherited, because they are the surfaces where a
  mismatch shows first.
- **A destructive menu entry** takes its red from the palette (`color1`) rather
  than from Obsidian's.

## 0.7.0 — 2026-08-31

### Changed

- **Top-level folders are marked by a rail, not by a filled block.** Picked from
  four rendered alternatives. A sidebar is short of exactly one thing — width —
  and a block spends it twice, on its own margin and on its inner padding. A
  folder is a place rather than a weighted category, and with no coloured field
  competing, the accent is free for the file you are actually looking at.

  The rail still carries the palette: warm Ember at the top of the list, cooling
  to Prussian at the foot. The **Intensity** slider now sets how present the rail
  is rather than how strong a fill is.

- **Hovering a folder** lifts its row and brightens its rail. The inner border
  is gone — it existed to raise a pill off a filled block, and without the block
  it read as a box drawn around one line.

### Added

- `docs/style-guide.md`: the binding visual rules, including why the rails won
  and what the three rejected alternatives cost.

## 0.6.0 — 2026-08-31

### Changed

- **On a phone the card layout is gone, not shrunk.** Obsidian only ever shows
  one column there — the explorer, the editor and the right sidebar are
  full-screen views the drawer switches between — so cards separated nothing
  that was not already separated, and only cost border, radius and area on the
  smallest screen there is. No desk, no gap, no rounding, no side borders; the
  ground becomes the surface, and the explorer uses the full width.
- **On a tablet the cards stay, but tighter.** Border yes, shadow no, gap and
  radius reduced. Border plus shadow plus gap say the same thing three times and
  make the columns look narrower than they are. Folder blocks lose their outer
  margin, because the double inset ate the folder names in an already narrow
  column.
- **A narrow desktop window** (621–1100 px, a vertical split) now gets the
  tablet treatment. The policy hangs on the width, not on the device.

### For developers

- Every comment in `theme.css` is now English. Only comments were touched — the
  CSS itself is byte-identical up to the new section.
