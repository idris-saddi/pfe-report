# Implementation chapter

What this chapter is for, what to include, and (especially) what to leave out.

## Tools and languages

The technical study may live in this chapter, or be done in parallel with the
theoretical study (the 2TUP model assumes the latter).

Either way, the goal here is to **argue for your technology choices**:

- A short state of the art of the candidate tools.
- A comparison on a few clear criteria (performance, ecosystem, learning curve,
  team familiarity, licensing).
- A synthesis.
- The justified pick.

Even if brief, this is what makes the choice defensible. "We used React because
we knew it" is not enough.

## Application walk-through

> It is tempting to fill this section with every screenshot of the application
> you worked so hard on — resist.

Rules:

- Use **carefully chosen** screenshots, not every UI panel you ever shipped.
- Present them as a **scenario**: pick one execution path (e.g. "creating a new
  customer") and walk through the interfaces involved in order.
- **Brief commentary**: describe the behaviour, not the visual details. The reader
  can see the picture.
- **Not too many images, not too much prose** — concise, as always.

## Code in the chapter

> Avoid pasting raw code: nobody wants to read the contents of your classes.

- Use **snippets** to highlight specific features — never full class dumps.
- Use the `lstlisting` environment with the right language (`java`, `xml`, etc.)
  and syntax colouring.
- Long extracts, installation steps, configuration files → push them to the
  **Appendix**.

## Tables

Comparison tables are excellent for the tooling section and for any "X vs. Y vs. Z"
analysis.

The template's example uses `tabularx` with `\linewidth` so the table always
fills the text width. Keep:

- A **bold first column** acting as row labels.
- **Centered cells** for the comparison axes.
- **Bold column headers**.
- A short **caption** (`\caption{...}`) and a **label** (`\label{tab:...}`) so
  you can `\ref{}` it from the prose.

Always reference the table from the prose: *"see Table~\ref{tab:xxx}"*. A table
that is never referenced is dead weight.

## Figures

Every figure must have:

- A `\caption` (used in the List of Figures).
- A `\label` so you can `\ref` it from the body.
- A reference in the body. Like tables, unreferenced figures are dead weight.

## Snippet checklist

Before keeping a code snippet in the body (vs. moving it to the appendix), ask:

- Does it show something the prose cannot describe more efficiently?
- Is it short enough to read at a glance (≈ 10–20 lines)?
- Is it commented or annotated to point at the interesting line?

If "no" to any, move it to the appendix or remove it entirely.
