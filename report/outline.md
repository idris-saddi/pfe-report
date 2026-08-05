# CLMPilot PFE — Report Outline

TOC for the graduation-project report on **CLMPilot** (Contract Lifecycle
Management for the European Mittelstand, built at Gradient Zero on the in-house
`comby` framework).

**Reading register: engineer-level, not developer-level.** Architecture,
abstraction, and business framing are what the reviewers look for. See
[../_Notes/](../_Notes/) for the writing rules. Implementation minutiae
(commands, configs, code) go to the Appendix.

## The pivot (2026-06-26)

The build reached **Phase 2 on the roadmap and stops there**. The CLMPilot
pilot is essentially complete: Phases 0, 1 and 2 — engineering foundations, a
full-stack MVP, and a tier of enterprise features (intelligence-assisted
extraction, electronic signature, custom fields, obligation tracking, advanced
reporting) — are realised and live in production at clmpilot.com.

The remainder of the internship is **not** the old "Phase 3 platform vision"
(public API, ERP integrations, marketplace, multi-region, Kubernetes). It is a
focused **R&D effort on the `comby` framework and the event-sourced core** —
extracting insight from broker communications, deepening multi-tenancy, and
scaling the framework and the event store. This work is planned and designed in
the remaining time, not necessarily fully implemented. (In the end it produced
the comby framework audit of 2026-07-07 and stopped there — see the
"Chapter V retired" note below.)

So the report **drops the per-phase release chapters** (the earlier III Phase 0,
IV Phase 1, V Phase 2, VI Phase 3 layout) and adopts a **four-chapter
structure**: framing and design (Chapters I–III), then realisation
(Chapter IV). (History: on 2026-07-06 the supervisor asked for the old
Chapter I to be split into a context/scope chapter and a dedicated "Analysis
and Requirements Specification" chapter, giving five chapters in two parts;
on 2026-08-04 Chapter V and the part divisions were removed — see the
"Chapter V retired" note below.)

## Two design decisions that drove this structure

### 1 — Realisation organised by engineering theme, not by phase

The realised work spans three phases, but a phase-by-phase chapter would read as
a changelog and would split cross-cutting concerns (identity, integrations,
deployment) across chapters. Chapter IV instead walks **engineering themes that
span the stack** — the backend on comby, the contract domain, workflow and
temporal automation, intelligence and e-signature, the web application,
identity and multi-tenancy, deployment — and uses the realised domains as
illustrations of those themes. The roadmap's phase hierarchy remains the
traceability backbone behind it.

### 2 — A dedicated architecture chapter

Chapter III carries the structural narrative once (CQRS/ES, comby, the domain
model, topology, security, i18n) so the later chapters reference back instead of
re-deriving it. (It originally closed with a **§8 "Designed seams for
evolution"** that set up a standalone Chapter V; both were removed — Chapter V
on 2026-08-04, §8 on 2026-08-05. The forward-looking analysis now lives
entirely in the **Perspectives** section of the general conclusion, which
carries its own problem → proposed-solution reasoning grounded in the comby
audit, so the body chapters describe only the realised system.)

## Report-wide editorial rules (2026-07-06)

- **Chapter intros never reference another chapter**; they describe only what
  the chapter itself covers. **Chapter conclusions may reference only the
  _next_ chapter** (one-sentence lead-in). The General Introduction keeps its
  outline paragraph; body-section cross-references are unrestricted.
- **No figure or table directly after a heading** — every float gets one or
  two sentences of lead-in prose that reference it by `\ref`.
- **Floats are pinned with `[H]`** (the `float` package, loaded by the class):
  figures and tables appear exactly where they sit in the source; if one does
  not fit, the page ends early and it opens the next page. Trailing white
  space is accepted. The `\pumlfig` helper emits `[H]` too — use `[H]` for any
  new float.

## Chapter V retired (2026-08-04)

The planned **Chapter V — Improvements in the event-sourced system** is dropped
as a standalone chapter: the framework work will not be continued during the
internship, so a chapter of purely planned R&D is not defensible. Its material
moves into the **Perspectives** half of the general conclusion, grounded in the
comby framework audit of 2026-07-07 (`planning-doc/AUDIT.md`) — presented at
architecture level as an audit performed plus an evolution plan. The
`Chapter5/` folder is deleted. The `\part` divisions were removed at the same
time — with a single realisation chapter a two-part split no longer earned its
place.

## Final structure (4 chapters; no parts)

```
Front matter
├── Cover page                              (handled by \makethese)
├── Acknowledgements
├── Abstract                                (English; add French/Arabic if required)
├── Table of Contents
├── List of Figures
├── List of Tables
└── General Introduction                    (context / problem / contribution / outline)

Chapters
├── Chapter I — General Context and Project Scope        (chap:context)
│   ├── 1.  Hosting company: Gradient Zero
│   ├── 2.  Project context: CLM in the DACH Mittelstand
│   ├── 3.  Problem statement
│   ├── 4.  Proposed solution   (short scope statement, no implementation detail)
│   └── 5.  Methodology  (Extreme Programming: definition → practices applied →
│           solo adaptation → release-train planning + traceability)
│
├── Chapter II — Analysis and Requirements Specification (chap:analysis)
│   ├── 1.  Actors and use cases  (catalogue, diagrams, detailed use-case tables)
│   ├── 2.  Functional requirements  (incl. Enterprise capabilities)
│   └── 3.  Non-functional requirements
│
├── Chapter III — Architecture and Design                (chap:arch)
│   ├── 1.  Architectural drivers
│   ├── 2.  Why CQRS and Event Sourcing for CLM?
│   ├── 3.  The comby framework
│   ├── 4.  Domain model overview  (core 4 contexts + 4.4 Extension contexts)
│   ├── 5.  System topology
│   ├── 6.  Security and compliance model
│   └── 7.  Internationalisation strategy
│
└── Chapter IV — Realisation of the CLMPilot platform    (chap:realisation; Phases 0–2, by theme)
    ├── 1.  Engineering foundations and the delivery process  (opens with the project-timeline Gantt)
    ├── 2.  Backend service architecture on comby
    ├── 3.  The contract domain and its lifecycle
    ├── 4.  Workflow and temporal automation
    ├── 5.  Document intelligence and electronic signature
    ├── 6.  The web application and internationalised user experience
    ├── 7.  Identity, access control and multi-tenancy in practice
    └── 8.  Production deployment and release operations

Back matter
├── Conclusion and Perspectives   (Perspectives absorb the retired Chapter V:
│    event-sourced-framework evolution from the comby audit, deeper
│    multi-tenancy, broker-communication insight, Phase 3 roadmap)
├── References (bibliography)
└── Appendix A — Miscellaneous
    ├── A.1  Glossary
    ├── A.2  Comby framework reference  (commands/queries/events catalogue)
    ├── A.3  Configuration files  (docker-compose, nginx, systemd)
    ├── A.4  OAuth setup walkthroughs  (Google Drive, SharePoint)
    └── A.5  API contract excerpts + UI gallery
```

## Current build state (2026-07-06)

| Chapter | State |
|---|---|
| I — General Context and Project Scope | Written; split from the old Ch I; new Proposed-solution section; Methodology = Extreme Programming (solo-adapted, release-train release planning), structured after the Ghassen Benali reference report; cites Beck2004 + C2XPForOne |
| II — Analysis and Requirements Specification | Written; actors/use-cases → functional → non-functional; detailed use-case description tables for contract creation, approval, audit reconstruction |
| III — Architecture and Design | Written; stale facts fixed (intelligence realised, DocuSeal, EN-primary); §8 seams section removed 2026-08-05 (analysis moved to the conclusion's Perspectives) |
| IV — Realisation of the CLMPilot platform | **Section-level skeleton** — 8 themed sections with `% intent` + `% figure` notes; §1 opens with the project-timeline Gantt |
| V — Improvements in the event-sourced system | **Retired 2026-08-04** — no longer included; material folded into the conclusion's Perspectives (see note above) |

The earlier per-phase placeholders are **retired and removed** — no longer
`\include`-d in [report.tex](report.tex).

## Diagrams

Figures are PlantUML sources in each chapter's `figures/` directory, rendered to
vector PDF and included via a self-healing helper (`\pumlfig`, or the
`\IfFileExists` stub) so the document compiles whether or not a diagram has been
rendered yet. Chapters I to III carry rendered diagrams, and Chapter IV opens
with the rendered project-timeline Gantt (`Chapter4/figures/gantt.puml`);
Chapters IV and V otherwise name the intended UML view per section in
`% figure:` comments, to be drawn as the prose is written. Render locally with:

```
plantuml -tsvg figures/<name>.puml && rsvg-convert -f pdf -o figures/<name>.pdf figures/<name>.svg
```

(The output is named after the `@startuml <id>`, not the input filename.)

## What goes in the appendix

| Appendix | Content type |
|---|---|
| A.1 | Glossary (CLM, GoBD, CQRS, ES, DDD, RBAC, MFA, SLA, ERP, SaaS, IaC, OIDC, MVP). |
| A.2 | Comby framework reference: commands, queries, events catalogue. |
| A.3 | Configuration files (docker-compose, nginx, systemd) — trimmed but real, with secrets redacted. |
| A.4 | OAuth setup walk-throughs (Google Drive, SharePoint) for a customer admin. |
| A.5 | API contract excerpts + the rest of the UI gallery. |

**Rule of thumb:** anything that answers a HOW question and runs longer than
~10 lines belongs in the appendix, not the body. The body chapters answer
WHY and WHAT.
