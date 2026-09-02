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

## Obsidian's own variables count as ours

A rule the theme writes by hand covers one surface. A variable Obsidian reads
covers every surface Obsidian draws — and there are far more of those than of
ours. Leaving one unset does not mean "no opinion", it means Obsidian's opinion,
which is a blue-violet accent that belongs to no palette here.

So: **anything Obsidian derives from the palette must be handed the palette.**
Section 4 of `theme.css` is where that happens. Two of them are easy to miss and
are the reason this was a bug:

- `--color-accent` is built from `--accent-h`, `--accent-s` and `--accent-l` —
  three numbers, not a colour. Setting the colour alone does nothing for the two
  dozen rules that read the components. The plugin emits the components from the
  active palette's `color3`; the theme must not assume they are already right.
- The **states** of a surface belong to whoever styled the surface. Styling a
  menu panel and leaving `.menu-item.selected` to Obsidian is what produced a
  palette-coloured dropdown with a blue row in it.

When adding a rule that styles a native Obsidian element, check its states in
the same change.

## Geometry: two radii, and one file that owns them

**Decided 2026-09-01**, after a field review on a tablet and a phone found the
plugin's stylesheets carrying 184 literal `border-radius` values against 45 that
used a token, the theme carrying 31 more, `1px solid …` written out 109 times
across the two, 89 raw `opacity:` literals, and 41 separate `.nx-*-btn` class
families. The complaint that produced this section was "the same element looks
different on every page", and it was correct.

Everything shared — radii, border width and colour, surface lifts, control
height, field width, spacing — is declared in **one block**, twice:

- the plugin's `src/styles/00-tokens.css`, on `:root`
- `theme.css` section 1, on `.theme-dark, .theme-light`

The theme's selector wins when the theme is active; the plugin still has every
token it uses under any other theme. Before this, the two disagreed — the theme
said a 15px container radius, the plugin's fallbacks said 12px and 10px — which
is why the plugin looked like a different product depending on the theme. The
blocks are bounded by `/* >>> NX TOKENS >>> */` markers and must stay identical
between them.

### The two

| Token | For |
|---|---|
| `--nx-radius` | Anything that **contains** something: card, panel, modal, code block, callout, banner, image, popover. |
| `--nx-r-tile` | Anything that **is** a control: button, input, list row, tab, chip, tag, swatch, toggle. |

Two more exist and are **shapes, not radii**: `--nx-r-circle` where the element
genuinely is a circle (a colour dot), and `--nx-r-pill` only where the shape
carries meaning — a segmented control, a status pill. An ordinary button is
never a pill.

**A literal radius outside the token block is a defect.** The only permitted
literal is `0`. The style variants (`nx-style-plain`, the narrow-window block,
the tablet block, the Notion-like palette) override the two tokens and nothing
else; that is the mechanism working, not an exception to it.

### The numbers: 10px and 6px

**Decided 2026-09-02**, from four rendered variants of the same screen —
`18/12`, `15/10` (what the theme said), `10/6` and `6/4`.

`10 / 6` won, and not only on taste:

- **The theme was already saying it.** The tablet block and the narrow-window
  block both overrode the container radius to `10px`, because `15px` was too
  round in a column that narrow. Making it the base removes a difference between
  devices instead of adding one — those two overrides are now gone, and a phone,
  a tablet and a desktop draw the same corner.
- **A code block reads as a code block again.** At `15px` the radius approached
  half the height of a short fence and the box read as a lozenge.
- `18/12` softened the panel until the corner was the loudest thing on it, and
  `6/4` gave up the signature entirely — at that point the plain style has
  nothing left to be quieter than.

The two remaining overrides are deliberate and stay: the Notion-like palette at
`6/3` and `nx-style-plain` at `0/6`. Those are style variants saying something
about themselves, not devices disagreeing.

## Code blocks and quotes: one shape, not a stack

In Live Preview, Obsidian puts `HyperMD-codeblock-bg` on **every `.cm-line` of
the block**, not on a wrapper. A radius on that class therefore rounds every
line separately, and a ten-line block renders as ten bars butted together with a
pinched waist at each seam — which is what "code blocks look like they were
glued together from single lines" meant.

The rule: the middle lines get `0`, `-begin` rounds the top corners, `-end`
rounds the bottom, and a single-line block carries both classes and rounds all
four. `.cm-blockquote` has the identical structure and the identical fix, except
that its left edge stays square because the quote rail lives there.

Verified by computed style, not by eye: begin `10px 10px 0 0`, middle `0`, end
`0 0 10px 10px`, single line `10px`.

## The explorer rail: ten stops that turn around

**Decided 2026-09-01.** The rail's tone still runs warm Ember to cool Prussian,
but the sweep is now a **ping-pong over ten positions**: folders 1–10 walk from
warm to cool, 11–19 walk back, then it repeats.

The monotonic ramp it replaced normalised over seven steps, so from the eighth
folder down every rail was the same saturated cool tone — and that tone is the
darkest slot in the palette. The bottom half of a long sidebar read as no colour
at all. A sweep that turns around cannot run out: folder 12 is as warm as folder
8, and **no folder is ever colourless**, which was the requirement.

Two supporting changes make the cool half survivable: the cool end is lifted off
`--wl-color5` onto `--wl-color6` (the light Prussian of the same family, so it
stays blue instead of going grey) and then a little toward the bright ink, and
the presence floor rose from 45% to 58%.

Written as plain `:nth-child()` rules, twenty-four of them. **No CSS `mod()`** —
Obsidian on Android renders in the system WebView, which is not something to bet
a visible feature on.

The rail also belongs to the folder and nothing inside it may draw over the
rail: the active file's rounded background is pinned to a non-negative inline
inset, so a full-bleed row highlight can no longer sit on top of it.

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
