# Theoretical study

A theoretical study contains one (or both) of two subparts: a **State of the Art**
and a **Study of the Existing System**.

## State of the Art

A detailed survey of what already exists — on the market or in the literature.

Goal:

- **Compare** existing solutions on consistent criteria.
- **Analyse** the result of the comparison.
- **Conclude** why none of the surveyed solutions fully address your problem.

If the conclusion of the comparison is *"existing solutions are fine"*, then your
project has no contribution to make. The state of the art is what justifies the
project's existence — write it from that angle.

Common mistake: a state of the art that just *describes* solutions one after the
other, with no comparison criteria and no synthesis. That is a literature dump,
not a state of the art.

## Study of the Existing System

Used when the project extends or modifies an existing piece of software, not when
you build something from scratch.

Content:

- What is already in place in your working environment.
- What its capabilities and limits are.
- What the gap is — i.e. what your module / modification adds.

A study of the existing is **not** a marketing brochure for the host company's
current product. It is an honest functional description plus the gap analysis.

## Which one do you need?

| Situation | Which subpart |
|---|---|
| Greenfield project | State of the Art only. |
| Extending company's existing product | Both: SotA for the domain, Existing for the host system. |
| Pure migration / refactor | Existing only, with brief SotA of target tech stack. |
| Pure theoretical / research | State of the Art only — deeper than usual. |

## Figures

A diagram (or even a single image like the template's `art.jpg`) that illustrates
the landscape of existing solutions is a strong addition. Use it once, at the
start of the State of the Art, and reference it later.
