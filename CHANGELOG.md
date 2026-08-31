# Changelog

Grouped by what changed for you, not by commit. Newest first.

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
