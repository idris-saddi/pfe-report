# Technical references

Domain links collected for the PFE topic, gathered from the Drive `Sources` doc
plus context.

## CQRS & Event Sourcing

The Drive `Sources` doc (created 2026-02-04 by Idris) points at three Kurrent /
EventStore articles:

- [A Beginner's Guide to CQRS](https://www.kurrent.io/cqrs-pattern) — CQRS
  pattern overview: separating Command and Query responsibilities, the read
  model / write model split.
- [Introduction to Event Sourcing](https://www.kurrent.io/event-sourcing) — why
  persist events instead of state, the write-model perspective, snapshotting.
- [Event Sourcing and CQRS](https://www.kurrent.io/blog/event-sourcing-and-cqrs)
  — how the two patterns combine (and how they do not require each other).

> Note: Kurrent.io is the new brand name of the company formerly known as
> Event Store Ltd. — they are the same maintainers behind the original
> EventStoreDB.

## How to cite these in the PFE

These are vendor blog posts. Acceptable as references for *introducing* the
pattern (with citation), but **not as the only references** for these patterns.
For a defensible State of the Art on CQRS / Event Sourcing, pair them with at
least one of:

- **Greg Young** — *CQRS Documents* (the original 2010 whitepaper that defined
  the pattern). PDF widely cited.
- **Martin Fowler** — [Event Sourcing](https://martinfowler.com/eaaDev/EventSourcing.html)
  and [CQRS](https://martinfowler.com/bliki/CQRS.html) on martinfowler.com.
- **Vaughn Vernon** — *Implementing Domain-Driven Design* (Addison-Wesley, 2013),
  ISBN 978-0321834577 — Chapter 4 (Architecture) covers CQRS in DDD context.
- **Eric Evans** — *Domain-Driven Design: Tackling Complexity in the Heart of
  Software* (Addison-Wesley, 2003), ISBN 978-0321125217 — the foundational DDD
  book; cite it whenever you talk about aggregates, bounded contexts, or domain
  events.

Following the bibliography rules ([bibliography.md](bibliography.md)): books and
peer-reviewed articles should outnumber blog posts. Use Young/Fowler/Vernon/Evans
as the spine and the Kurrent articles as supporting references.

## Comby framework (project-specific)

If your PFE is the CLM / ContractPilot project (and given the project structure
under `/Users/idris/clmpilot/`, that looks likely), the implementation chapter
will need to introduce the **comby** framework (the company's internal CQRS/ES
framework on which the application is built). Treat it as a custom platform:

- Cite the framework version (v3.x).
- Show one or two architectural diagrams (domains, commands, queries, events,
  reactors) — see [design-and-diagrams.md](design-and-diagrams.md) on diagram
  hygiene.
- Justify _using_ comby over alternatives (EventStoreDB, Axon, EventFlow, custom
  Go solution) — this is the "Tools and Languages" justification described in
  [implementation.md](implementation.md).

## Other topic-area references to consider

Depending on what exact angle your project takes, build up:

- **Contract management / CLM**: SAP CLM, ServiceNow CLM, Ironclad, Juro,
  ContractWorks — the competitive landscape from the project's Idea.md.
- **DDD aggregates and domain events**: Evans 2003, Vernon 2013, Plumbur 2017
  for a more modern take.
- **Compliance (DACH context)**: GoBD (Grundsätze ordnungsmäßiger Buchführung),
  GDPR, ISO 27001 — cite the official spec documents, not blog summaries.

## Resource inventory (Drive folder)

What lives in the Drive folder `PFE ressources/`:

- `Modele_Latex___Rapport_PFE_INSAT_ENG.zip` — INSAT English LaTeX template.
  Already mirrored locally as
  [_ModelNewEN](../_ModelNewEN/) (with 2026 modernization applied).
- `Sources` (Google Doc) — the CQRS/ES links above.
- `PFE examples/` — seven example PFE reports plus three shortcuts.
  See [example-reports.md](example-reports.md).
- `Pour Écrire un Bon Rapport.pdf` — the 2013 Lilia Sfaxi guide that produced
  this entire `_Notes/` folder.
