# CLMPilot PFE — Report Outline

Proposed TOC for the graduation-project report on **CLMPilot** (Contract Lifecycle
Management for the European Mittelstand, built at Gradient Zero on the in-house
`comby` framework).

**Reading register: engineer-level, not developer-level.** Architecture,
abstraction, and business framing are what the reviewers look for. See
[../_Notes/](../_Notes/) for the writing rules. Implementation minutiae
(commands, configs, code) go to the Appendix.

## Constraints that drove this design

### 1 — Volume balance

A literal "one chapter per phase" TOC would put the project's volume at:

| Phase | Tasks | Sections | Weight if one chapter |
|---:|---:|---:|---:|
| 0 — Foundation | 27 | 4 | ~5%  |
| **1 — MVP** | **642** | **25** | **~60%** |
| 2 — Enterprise | 147 | 8 | ~20% |
| 3 — Platform | 100 | 9 | ~15% |

→ Phase 1 is split into three release chapters (1A, 1B, 1C) so no chapter
dominates the report.

### 2 — Engineer-level framing

INSAT PFEs are graded as engineering work, not developer work. A "section per
roadmap task" structure (one section per domain, one section per page, one
section per tool) reads as a developer's checklist. Instead, each release
chapter is **pattern-led**: sections cover recurring architectural patterns
(CQRS, reactors, adapters, SPA composition, security posture, release process),
with the roadmap subsections appearing as illustrations inside those patterns.

→ A dedicated **Architecture and Design** chapter (Chapter II) carries the
structural narrative, and the release chapters reference back to it instead of
re-introducing it each time.

## Current build state (2026-05-20)

| Chapter | State |
|---|---|
| I — General Context | Skeleton ready, awaiting content |
| II — Architecture and Design | Skeleton ready, awaiting content |
| III — Phase 0: Engineering Foundations | Skeleton ready, awaiting content |
| IV — Phase 1A: Backend Delivery | Skeleton ready, awaiting content |
| V — Phase 1B: Frontend Delivery | Skeleton ready, awaiting content |
| VI — Phase 1C: Production Deployment | Skeleton ready, awaiting content |
| VII — Phase 2: Enterprise Features | **Deferred** — placeholder file only; `\include` commented out in `report.tex`. Re-enable when Phase 2 work begins. |
| VIII — Phase 3: Platform Vision | **Deferred** — placeholder file only; `\include` commented out in `report.tex`. Re-enable when Phase 3 work begins. |

Phase 2 and Phase 3 currently live only as forward-looking text inside the
**Conclusion's "Perspectives" section**, which is by design the right place to
preview future work.

**To re-enable Chapters VII / VIII** when those phases get worked on:

1. Uncomment the corresponding `\include{ChapterN/chapterN}` lines in
   [report.tex](report.tex) (lines under the "Phase 2 and Phase 3 chapters are
   deferred" comment).
2. Replace the placeholder content in `Chapter7/chapter7.tex` and
   `Chapter8/chapter8.tex` with a real skeleton (copy the template from any of
   Chapters IV–VI and adapt sections from the breakdown in the placeholder's
   comments).
3. Update the "Report outline" paragraph in
   [Introduction/introduction.tex](Introduction/introduction.tex).

## Final structure (8 chapters; 6 active)

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

├── Chapter I — General Context
│   ├── 1.  Hosting company: Gradient Zero
│   ├── 2.  Project context: CLM in the DACH Mittelstand
│   ├── 3.  Problem statement
│   ├── 4.  Functional requirements
│   ├── 5.  Non-functional requirements
│   ├── 6.  Actors and high-level use cases
│   └── 7.  Methodology  (release-train; planning cadence; traceability)
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

├── Chapter III — Phase 0: Engineering Foundations  (~6-8 pages)
│   ├── 1.  Repository and branch protection model  (4-repo split; rationale)
│   ├── 2.  Continuous integration strategy
│   ├── 3.  Roadmap as a single source of truth
│   └── 4.  Development environment philosophy
│
├── Chapter IV — Phase 1A: Backend Delivery  (~14-16 pages)
│   ├── 1.  Backend service composition
│   ├── 2.  Command-Query Responsibility Segregation in practice
│   ├── 3.  Aggregate design and bounded contexts  (the four, briefly)
│   ├── 4.  Reactive patterns: events driving side effects
│   ├── 5.  External integration patterns  (DocumentLink as the canonical case)
│   └── 6.  Authentication, authorisation and identity
│
├── Chapter V — Phase 1B: Frontend Delivery  (~12-14 pages)
│   ├── 1.  Single-page application architecture
│   ├── 2.  Modular composition: composables and components
│   ├── 3.  API integration and state management
│   ├── 4.  Authentication user journey
│   ├── 5.  Internationalisation in practice
│   └── 6.  Feature realisation walk-through  (one scenario, not a page tour)
│
├── Chapter VI — Phase 1C: Production Deployment  (~10-12 pages)
│   ├── 1.  Production topology
│   ├── 2.  Infrastructure choices and trade-offs
│   ├── 3.  Edge and transport security
│   ├── 4.  Observability and operational posture
│   └── 5.  Release process and MVP validation
│
├── Chapter VII — Phase 2: Enterprise Features    [DEFERRED]
└── Chapter VIII — Phase 3: Platform Vision        [DEFERRED]

Back matter
├── Conclusion and Perspectives                 (recap + Phase 2/3 perspectives)
├── References (bibliography)
└── Appendix A — Miscellaneous
    ├── A.1  Glossary
    ├── A.2  Comby framework reference  (commands/queries/events catalogue)
    ├── A.3  Configuration files  (docker-compose, nginx, systemd)
    ├── A.4  OAuth setup walkthroughs  (Google Drive, SharePoint)
    └── A.5  API contract excerpts
```

## What changed vs. the earlier draft

| Earlier draft | New structure | Why |
|---|---|---|
| Architecture was a section inside Chapter I | **Chapter II (own chapter)** | Engineer-level reading requires architecture as a first-class chapter, matching INSAT example reports (Ihsen, Marouane, Ghassen, Hela). |
| Phase 1A: section per domain, with "Aggregate / Commands / Read models / Reactor / REST / Tests" subsections | Phase 1A: section per **pattern** (composition, CQRS, aggregates, reactors, adapters, identity) | Pattern-led sections read as engineering; artefact-led sections read as a developer's checklist. |
| Phase 1B: section per page (Dashboard, Contract list, Document linker, …) | Phase 1B: section per **pattern** (SPA architecture, composition, API integration, auth journey, i18n) + ONE walk-through scenario | A page-by-page tour is a UX inventory; the engineer's contribution is the cross-cutting pattern set. |
| Phase 1C: section per tool (Hetzner, Docker, Nginx, monitoring, backups) | Phase 1C: section per **posture** (topology, infrastructure trade-offs, edge security, observability, release process) | Tools are illustrations of decisions; the decisions are the engineering story. |

## Volume control — split candidates

If during writing a chapter blows past ~18–20 pages, the next split candidates
are, in priority order:

1. **Chapter II (Architecture)** — if it exceeds 20 pages, split into
   "II. Architecture" (drivers, CQRS/ES, comby, domain model) +
   "III. System Design" (topology, security, i18n). All later chapter numbers
   shift by one.
2. **Chapter IV (Backend Delivery)** — if reactors + adapters alone fill more
   than 8 pages, split *Reactive patterns + External integration patterns*
   into a 4A.2 chapter. The DocumentLink integration is genuinely the most
   novel sub-system in Phase 1, and may earn its own chapter.
3. **Chapter VII (Phase 2)** — split *Intelligence service* into its own
   chapter if the LLM/metadata-extraction discussion expands. The intelligence
   service is the most novel sub-system of Phase 2.

## What goes in the appendix

| Appendix | Content type |
|---|---|
| A.1 | Glossary (CLM, GoBD, CQRS, ES, DDD, RBAC, MFA, SLA, ERP, SaaS, IaC, OIDC, MVP). |
| A.2 | Comby framework reference: commands, queries, events catalogue. |
| A.3 | Configuration files (docker-compose, nginx, systemd) — trimmed but real, with secrets redacted. |
| A.4 | OAuth setup walk-throughs (Google Drive, SharePoint) for a customer admin. |
| A.5 | API contract excerpts (OpenAPI snippets) that didn't fit inline. |

**Rule of thumb:** anything that answers a HOW question and runs longer than
~10 lines belongs in the appendix, not the body. The body chapters answer
WHY and WHAT.
