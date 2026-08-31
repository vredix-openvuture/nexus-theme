# Changelog

Grouped by what changed for you, not by commit. Newest first.

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
