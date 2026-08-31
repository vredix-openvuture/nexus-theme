# Nexus style guide

Binding rules for anything visual in the theme and in the plugin's own surfaces.
Where this file and a habit disagree, this file wins.

It lives in the project repo rather than in the wiki on purpose: the wiki
explains the product to whoever uses it, this tells whoever writes the next
piece of UI what they are allowed to do.

## The two axes

Every visual decision belongs to exactly one of them, and they never depend on
each other.

| Axis | Decides | Values |
|---|---|---|
| **Style** | The *shape* of the interface | `mirobo` · `almost nothing` |
| **Palette** | The *colour* of whatever the style built | 15, default `nexus` |

A rule that reaches across both is a mistake. The style shapes; the palette
colours.

## Colour

- **Every colour comes from a palette slot**, never from a literal. `color0`
  ground, `color3` accent, `color5` border source, `color7` text, `color8`
  muted, `color15` bright. A hardcoded hex in a component is a defect.
- **The accent is scarce.** It marks *active*, *due* and *done*, and the file
  you are looking at. Anything that uses it for decoration takes it away from
  the thing that needed it.
- **Surfaces stay close to the ground colour** and are lifted, not tinted. A
  surface flooded with the accent stops being a surface and becomes a label.

## The explorer: rails, not blocks

**Decided 2026-08-31**, from four rendered alternatives. Top-level folders are
marked by a two-pixel rail on their left edge, not by a filled block.

What made it win:

- **A sidebar is short of exactly one thing: width.** A block spends it twice —
  once on its own margin, once on its inner padding — and the folder names are
  what pays.
- **A folder is a place, not a weighted category.** A filled field says "this
  group is heavy". A rail says "this group starts here", which is the true
  statement.
- **It gives the accent back.** With no coloured field competing, the accent is
  free for the active file, which is the one thing in the list that genuinely
  needs to stand out.
- **It survives a narrow column.** On a phone and in a split, blocks lose most
  of their width to their own margins; a rail does not change.

The rail still carries the palette: its tone runs from warm Ember at the top of
the list to cool Prussian at the foot, spread over seven positions because a
real vault has four to eight top-level folders. A sweep sized for sixteen leaves
an actual vault entirely in the warm end — the gradient exists and nobody sees
it.

What was rejected, and why it is worth knowing:

| | Why not |
|---|---|
| Filled blocks (the previous look) | Two saturated colours before anything is opened; the whole list flickered orange under the mouse |
| Quieter blocks | Better, but still spends width on margins and still implies folders are weighted |
| Plain list | Quietest and fastest to scan, but gives up the signature in the one place people look most |

## Density

- **One device, not three.** A border, a shadow and a gap all say "these are
  separate". Pick one. On a tablet that means border yes, shadow no, gap halved.
- **On a phone the card system is removed, not shrunk.** Obsidian shows one
  column there; cards separate nothing that is not already separated.
- **Responsive rules hang on the width**, not on the device, so a narrow
  desktop split behaves like a tablet.

## Motion

Only for state changes, and under 200 ms. There is no decorative animation
anywhere in this theme and there should not be.

## What is banned

Unless a specific request overrides it: neon, glow, shadow used as an accent,
one-sided borders and other asymmetric decoration, gradient borders,
glassmorphism, blurred backgrounds, animated backgrounds, oversized letter
spacing, monospace as a display face, all-caps headings.

## Proposing a change

A visual change that is a matter of taste gets **four comparable variants**,
rendered in the real palette with the same content in each, and the current look
as one of them. Nothing changes in the theme until one is picked. What won, and
what made it win, is written here.
