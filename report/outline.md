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
the remaining time, not necessarily fully implemented.

So the report **drops the per-phase release chapters** (the earlier III Phase 0,
IV Phase 1, V Phase 2, VI Phase 3 layout) and adopts a **four-chapter
structure** in two parts: framing and design, then realisation and planned
evolution.

## Two design decisions that drove this structure

### 1 — Realisation organised by engineering theme, not by phase

The realised work spans three phases, but a phase-by-phase chapter would read as
a changelog and would split cross-cutting concerns (identity, integrations,
deployment) across chapters. Chapter III instead walks **engineering themes that
span the stack** — the backend on comby, the contract domain, workflow and
temporal automation, intelligence and e-signature, the web application,
identity and multi-tenancy, deployment — and uses the realised domains as
illustrations of those themes. The roadmap's phase hierarchy remains the
traceability backbone behind it.

### 2 — A dedicated architecture chapter that names its seams

Chapter II carries the structural narrative once (CQRS/ES, comby, the domain
model, topology, security, i18n) so the later chapters reference back instead of
re-deriving it. Critically, it closes with **§8 "Designed seams for evolution"**,
which names the three open seams — multi-tenancy, scalability/event-store growth,
and the intelligence/extraction pipeline — that **Chapter IV** then develops.
That is what lets the forward-looking chapter build on the design rather than
re-introduce it.

## Final structure (4 chapters; 2 parts)

```
Front matter
├── Cover page                              (handled by \makethese)
├── Acknowledgements
├── Abstract                                (English; add French/Arabic if required)
├── Table of Contents
├── List of Figures
├── List of Tables
└── General Introduction                    (context / problem / contribution / outline)

PART 1 — PROJECT FRAMING AND DESIGN

├── Chapter I — General Context and Analysis
│   ├── 1.  Hosting company: Gradient Zero
│   ├── 2.  Project context: CLM in the DACH Mittelstand
│   ├── 3.  Problem statement
│   ├── 4.  Functional requirements  (incl. 4.8 Enterprise capabilities)
│   ├── 5.  Non-functional requirements
│   ├── 6.  Actors and high-level use cases
│   └── 7.  Methodology  (release train: Phases 0–2 realised + planned R&D)
│
└── Chapter II — Architecture and Design
    ├── 1.  Architectural drivers
    ├── 2.  Why CQRS and Event Sourcing for CLM?
    ├── 3.  The comby framework
    ├── 4.  Domain model overview  (core 4 contexts + 4.4 Extension contexts)
    ├── 5.  System topology
    ├── 6.  Security and compliance model
    ├── 7.  Internationalisation strategy
    └── 8.  Designed seams for evolution   → bridges to Chapter IV

PART 2 — REALISATION AND PLANNED EVOLUTION

├── Chapter III — Realisation of the CLMPilot platform   (Phases 0–2, by theme)
│   ├── 1.  Engineering foundations and the delivery process
│   ├── 2.  Backend service architecture on comby
│   ├── 3.  The contract domain and its lifecycle
│   ├── 4.  Workflow and temporal automation
│   ├── 5.  Document intelligence and electronic signature
│   ├── 6.  The web application and internationalised user experience
│   ├── 7.  Identity, access control and multi-tenancy in practice
│   └── 8.  Production deployment and release operations
│
└── Chapter IV — Improvements in the event-sourced system   (planned R&D)
    (chapter shell — no sections yet; three planned areas recorded in the
     source as intent: broker-communication insight, multi-tenancy,
     scalability of comby and the event store)

Back matter
├── Conclusion and Perspectives
├── References (bibliography)
└── Appendix A — Miscellaneous
    ├── A.1  Glossary
    ├── A.2  Comby framework reference  (commands/queries/events catalogue)
    ├── A.3  Configuration files  (docker-compose, nginx, systemd)
    ├── A.4  OAuth setup walkthroughs  (Google Drive, SharePoint)
    └── A.5  API contract excerpts + UI gallery
```

## Current build state (2026-06-26)

| Chapter | State |
|---|---|
| I — General Context and Analysis | Written; reframed to Phases 0–2 realised + planned R&D |
| II — Architecture and Design | Written; §8 seams added; stale facts fixed (intelligence realised, DocuSeal, EN-primary) |
| III — Realisation of the CLMPilot platform | **Section-level skeleton** — 8 themed sections with `% intent` + `% figure` notes |
| IV — Improvements in the event-sourced system | **Chapter shell** — intro + Conclusion stubs; planned areas in source comments |

The earlier per-phase placeholders `Chapter5/` (Phase 2) and `Chapter6/`
(Phase 3) are **retired** — kept on disk for history, no longer `\include`-d in
[report.tex](report.tex).

## Diagrams

Figures are PlantUML sources in each chapter's `figures/` directory, rendered to
vector PDF and included via a self-healing helper (`\pumlfig`, or the
`\IfFileExists` stub) so the document compiles whether or not a diagram has been
rendered yet. Chapters I and II carry rendered diagrams; Chapters III and IV name
the intended UML view per section in `% figure:` comments, to be drawn as the
prose is written. Render locally with:

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
