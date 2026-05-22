# CLMPilot PFE — Report Outline

Proposed TOC for the graduation-project report on **CLMPilot** (Contract Lifecycle
Management for the European Mittelstand, built at Gradient Zero on the in-house
`comby` framework).

**Reading register: engineer-level, not developer-level.** Architecture,
abstraction, and business framing are what the reviewers look for. See
[../_Notes/](../_Notes/) for the writing rules. Implementation minutiae
(commands, configs, code) go to the Appendix.

## Constraints that drove this design

### 1 — Volume balance across phases

The original concern was that Phase 1 had 642 of the roadmap's 916 tasks (~60%),
which would have made it dominate a one-chapter-per-phase TOC. On a closer
look at Phase 2 and Phase 3, however, both are substantial full-stack programmes
in their own right — Phase 2 ships the intelligence service (a new Python
sub-system) plus DocuSign, custom fields, obligations and a mobile companion;
Phase 3 ships the public API, ERP integrations, multi-entity consolidation,
batch intelligence and a Kubernetes migration. When written out, Phases 2 and 3
will each weigh ~15–25 pages, so a single chapter per phase reads in balance:

| Phase | Realised? | Expected weight |
|---|---|---|
| Phase 0 — Engineering foundations | yes | ~6–8 pages |
| Phase 1 — MVP (full-stack delivery) | yes | ~25–30 pages |
| Phase 2 — Enterprise features | no (designed) | ~20–25 pages |
| Phase 3 — Platform vision | no (designed) | ~15–20 pages |

→ **Phase 1 is kept as a single chapter** that walks engineering themes spanning
the full stack (backend, frontend, identity, deployment), not three per-tier
chapters. The original 1A/1B/1C split is dropped.

### 2 — Engineer-level framing

INSAT PFEs are graded as engineering work, not developer work. Each release
chapter is **pattern-led**: sections cover recurring architectural patterns
(CQRS, reactors, adapters, SPA composition, security posture, release process),
not roadmap tasks or code components.

→ A dedicated **Architecture and Design** chapter (Chapter II) carries the
structural narrative, and the release chapters reference back to it instead of
re-introducing it each time.

## Current build state (2026-05-20)

| Chapter | State |
|---|---|
| I — General Context and Analysis | §1–§3 written; §4–§7 skeleton |
| II — Architecture and Design | Skeleton ready, awaiting content |
| III — Phase 0: Engineering Foundations | Skeleton ready, awaiting content |
| IV — Phase 1: MVP Delivery | Skeleton ready, awaiting content |
| V — Phase 2: Enterprise Features | **Deferred** — placeholder file only; `\include` commented out in `report.tex` |
| VI — Phase 3: Platform Vision | **Deferred** — placeholder file only; `\include` commented out in `report.tex` |

Phase 2 and Phase 3 currently live only as forward-looking text inside the
**Conclusion's "Perspectives" section**, which is by design the right place to
preview future work.

**To re-enable Chapters V / VI** when those phases get worked on:

1. Uncomment the corresponding `\include{ChapterN/chapterN}` lines in
   [report.tex](report.tex).
2. Replace the placeholder content in `Chapter5/chapter5.tex` and
   `Chapter6/chapter6.tex` with a real skeleton (copy the template from
   Chapter IV and adapt sections from the breakdown in the placeholder's
   comments).
3. Update the "Report outline" paragraph in
   [Introduction/introduction.tex](Introduction/introduction.tex).

## Final structure (6 chapters; 4 active)

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
│   ├── 1.  Hosting company: Gradient Zero          [WRITTEN]
│   ├── 2.  Project context: CLM in the DACH Mittelstand   [WRITTEN]
│   ├── 3.  Problem statement                        [WRITTEN]
│   ├── 4.  Functional requirements                  (todo)
│   ├── 5.  Non-functional requirements              (todo)
│   ├── 6.  Actors and high-level use cases          (todo)
│   └── 7.  Methodology                              (todo — release-train, traceability)
│
└── Chapter II — Architecture and Design
    ├── 1.  Architectural drivers
    ├── 2.  Why CQRS and Event Sourcing for CLM?
    ├── 3.  The comby framework  (role + justification of choice)
    ├── 4.  Domain model overview  (4 bounded contexts; 1 diagram)
    ├── 5.  System topology  (deployment + integration map)
    ├── 6.  Security and compliance model
    └── 7.  Internationalisation strategy

PART 2 — RELEASE-BASED DELIVERY

├── Chapter III — Phase 0: Engineering Foundations  (~6–8 pages)
│   ├── 1.  Repository and branch protection model
│   ├── 2.  Continuous integration strategy
│   ├── 3.  Roadmap as a single source of truth
│   └── 4.  Development environment philosophy
│
├── Chapter IV — Phase 1: MVP Delivery  (~25–30 pages, full-stack)
│   ├── 1.  Backend service architecture
│   ├── 2.  Domain realisation: the four bounded contexts
│   ├── 3.  Reactive patterns and external integrations
│   ├── 4.  Frontend application architecture
│   ├── 5.  Identity, authentication and access control  (full-stack)
│   └── 6.  Production deployment and release process
│
├── Chapter V — Phase 2: Enterprise Features    [DEFERRED]
└── Chapter VI — Phase 3: Platform Vision        [DEFERRED]

Back matter
├── Conclusion and Perspectives                 (recap + Phase 2/3 perspectives)
├── References (bibliography)
└── Appendix A — Miscellaneous
    ├── A.1  Glossary
    ├── A.2  Comby framework reference  (commands/queries/events catalogue)
    ├── A.3  Configuration files  (docker-compose, nginx, systemd)
    ├── A.4  OAuth setup walkthroughs  (Google Drive, SharePoint)
    └── A.5  API contract excerpts + UI gallery
```

## Why Chapter IV is one chapter, not three

The earlier draft had Phase 1 split into three chapters (1A backend, 1B
frontend, 1C production deployment). This split has been dropped:

- **Volume no longer requires it.** Once Phase 2 and Phase 3 are written, the
  six chapters balance naturally without artificial subdivision of Phase 1.
- **The story is better as one.** Phase 1's deliverable is a single thing — a
  live MVP — not three separate deliverables. Splitting it created artificial
  per-tier boundaries that the engineering work doesn't actually have
  (identity is a cross-cutting concern, the DocumentLink integration spans
  backend adapters + frontend pickers + OAuth flows, etc.).
- **One chapter forces engineering-theme organisation.** With three chapters
  it was tempting to fall back into "backend stuff / frontend stuff / ops
  stuff". With one chapter the sections must be themes that genuinely span
  the stack: identity, integrations, deployment — all explicitly full-stack.

Each Chapter IV section is therefore organised around a recurring engineering
pattern, and the four bounded contexts (Contract, Approval, Deadline,
DocumentLink) appear repeatedly as illustrations of those patterns, never as
the unit of organisation.

## Engineering themes inside Chapter IV

| Section | Pattern / theme it covers | Spans which tiers |
|---|---|---|
| 1. Backend service architecture | Composition, CQRS, authorisation asymmetry | Backend |
| 2. Domain realisation | The four aggregates and the key modelling decisions | Backend (referenced from frontend) |
| 3. Reactive patterns and external integrations | Reactor pattern; adapter pattern (DocumentLink, SendGrid) | Backend + outbound |
| 4. Frontend application architecture | SPA composition, API integration, walk-through | Frontend |
| 5. Identity, authentication and access control | Identity model + MFA + RBAC + user journey | Full-stack (backend + frontend) |
| 6. Production deployment and release process | Topology, infra trade-offs, observability, release | Infrastructure |

## Volume control — split candidates

If during writing a chapter blows past ~30 pages, the next split candidates
are, in priority order:

1. **Chapter IV (Phase 1)** — if it exceeds 35 pages, split into "IV. Phase 1
   Backend and Domain Realisation" (sections 1–3 + 5's backend half) and
   "V. Phase 1 Frontend and Operations" (sections 4 + 5's frontend half + 6).
   All later chapter numbers shift by one. This is the original 1A/1B/1C
   split returning if the prose unexpectedly grows.
2. **Chapter II (Architecture)** — if it exceeds 20 pages, split into
   "II. Architecture" (drivers, CQRS/ES, comby, domain model) +
   "III. System Design" (topology, security, i18n).
3. **Chapter V (Phase 2)** — split *Intelligence service* into its own
   chapter if the LLM/metadata-extraction discussion expands. The
   intelligence service is the most novel sub-system of Phase 2.

## What goes in the appendix

| Appendix | Content type |
|---|---|
| A.1 | Glossary (CLM, GoBD, CQRS, ES, DDD, RBAC, MFA, SLA, ERP, SaaS, IaC, OIDC, MVP). |
| A.2 | Comby framework reference: commands, queries, events catalogue. |
| A.3 | Configuration files (docker-compose, nginx, systemd) — trimmed but real, with secrets redacted. |
| A.4 | OAuth setup walk-throughs (Google Drive, SharePoint) for a customer admin. |
| A.5 | API contract excerpts + the rest of the UI gallery (the pages not covered by Chapter IV's walk-through scenario). |

**Rule of thumb:** anything that answers a HOW question and runs longer than
~10 lines belongs in the appendix, not the body. The body chapters answer
WHY and WHAT.
