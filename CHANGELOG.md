# Changelog

Grouped by what changed for you, not by commit. Newest first.

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
