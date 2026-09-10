# Phrasing review — weird / AI-sounding / overwrought language

Scope: all rendered prose in `report/` (chapter bodies, captions, table cells) as of
branch `restructure/split-context-analysis`. Abstract, Acknowledgements and the
Conclusion are still `\dots` stubs and Chapters IV–V are mostly skeleton, so the bulk
of findings are in the Introduction and Chapters I–III. LaTeX `% comments` were not
reviewed (they never render). **Nothing has been changed** — this is a checklist.

Severity: **[high]** = fix (reads machine-generated, wrong register, or an outright
error) · **[med]** = noticeable, consider rewording · **[low]** = borderline, taste call.

---

## 1. Cross-cutting patterns (the fingerprint)

These matter more than any single sentence. Individually each instance is defensible;
at this density they read as one generator's tics.

| Pattern | Count | Notes |
|---|---|---|
| "X rather than Y" antithesis | ~~31×~~ **THINNED 2026-07-07** | Reduced to 14 load-bearing instances (uncommitted). Dropped the foil to make a plain statement where it added little (Intro L49, Ch1 L141/L172, Ch2 L430/L448/L502, Ch3 L37/L44/L424/L572/L606); varied to "X, not Y" where the contrast matters but the phrasing repeated (Ch1 L52/L85, Ch2 L26, Ch3 L357 — which also lost its "clearest evidence"/"center" self-praise). Kept the genuinely contrastive ones (session-not-request isolation, archive-not-delete, link-not-ingest, small-releases, etc.). Rebuilt clean: 63 pages, 0 errors. |
| Em-dash asides (` -- `) | ~~~116 in Intro+Ch I–III~~ **FIXED 2026-07-06** | Converted to commas, parentheses, or colons throughout Intro + Ch I–V (uncommitted). 4 functional constructions kept: the *Mittelstand* definition (Intro), the release-train aside (Ch I §1.3, has internal parens), the *link* definition (Ch II §2.2), the three-runtime-services list (Ch III §5.2, has internal parens). The `~--~` Phase-label separators in Ch I §5.4 also stay. Rebuilt clean: 63 pages, 0 errors. |
| Punchy verdict fragments | ~~~10~~ **FIXED 2026-07-07** | Merged into neighbouring sentences (uncommitted): "This is the strongest driver." → folded into the ISO clause; "The costs are real." → "This approach carries real costs."; "Three points decide it." + "There is one backend, not many." + "No single control is trusted to be enough." → colon-joined to the following clause; "The choice is not close." → deleted (preceding sentence carries the verdict); "Network isolation is by design." → rewritten as "Network isolation is built into the topology: …", which also removed the obscure "A public edge faces out; an internal network does not" epigram (see epigram-pair row). **Kept** "The system clock is the fifth actor." (Ch II L76) per §4 — functional named-actor device. Rebuilt clean: 64 pages, 0 errors. |
| Epigram pairs "X survives; Y does not" | ~~2×~~ **1 left 2026-07-07** | Ch III L404–405 "A public edge faces out; an internal network does not." removed with the punchy-verdict pass (rewritten into the network-isolation sentence). Remaining: L536–537 "The record that something happened survives; the personal data within it does not." — now a lone instance, so the "visible template" concern is largely gone; keep or reword on its own merits. |
| "surface" as verb/noun-of-art | ~~10×~~ **FIXED 2026-07-07** | Reduced to 0 in prose (uncommitted). "surfacing them"→"flagging them", "surfaces the portfolio"→"shows", "authentication surface"→"authentication layer", "everyday surface through which IAM is exercised"→"the flows through which non-Admin users actually exercise IAM", "owns this surface"→"covers this", "small custom surface"→"a small amount of custom code", "API surface"→"the ordinary API", "previews surface a transient-error state"→"show", "Free at the surface"→"Nominally free". |
| "seam(s)" | ~~16×~~ **THINNED 2026-07-07** | Left the §8 "Designed seams" cluster and the named seams (scaling seam, OpenAPI seam) intact as the deliberate device; removed the incidental Intro-outline use and the Ch IV "deliberately left" qualifier. Density now concentrated where the concept is defined. |
| "deliberately / intentionally / on purpose" | ~~7+~~ **FIXED 2026-07-07** | Cut to 2 sanctioned uses ("Simple design → deliberately narrow" Ch I; "The actor model is intentionally narrow" Ch II). Removed the rest (Intro outline, "deliberately not built", "bypasses … deliberately", "documents deliberately left", "deliberate adaptation", "absent on purpose"→"absent here", Ch IV "deliberately left", Ch II "deliberately relies"). |
| "posture" | ~~7×~~ **FIXED 2026-07-07** | 0 in prose. All "compliance posture" → "compliance" / "compliance controls" / "compliance guarantees"; the two Ch IV "observability posture" uses are in `%` comments (skeleton), untouched. |
| "machinery" | ~~5×~~ **FIXED 2026-07-07** | 0 left. → "flow", "logic", "mechanisms", "components", "handling". |
| "forward-looking" | ~~5×~~ **FIXED 2026-07-07** | 0 in prose. Dropped or → "planned" (Intro, Ch I ×3, Ch V). |
| "first-class" (object/aggregate/record) | ~~4×~~ **FIXED 2026-07-07** | Down to 2: kept "first-class object" (Ch I solution statement) and "first-class aggregate" (Ch III, legit CS idiom). Reworded "first-class object" (cause clause)→"managed entity" and table "first-class record"→"structured record". |
| "shape / shaped / solution shape" | ~~7×~~ **FIXED 2026-07-07** | "common solution shape"→"common solution"; "aggregate-shaped"→"fetch whole aggregates"; "The same shape (…)"→"The same pattern (…)"; "most shapes"→"drives"; "shaped by a constraint"→"governed by"; "and shapes the choices"→"and drives"; "forces shape our approach"→"forces drive the design". |
| Poetic inversion "Above/Beneath/Around X sits Y" | ~~6×~~ **FIXED 2026-07-07** | Down to 1 (kept "Above the per-tenant model sits the system administrator", Ch III — clean). Reworded "Around comby sits…", "Above them sits… administrator", "Beneath them sits the isolation…", "Four stores sit behind them". |
| Personification of artefacts | **ADDRESSED 2026-07-07** | Fixed the load-bearing ones: "code remembering to filter"→"every query filtering"; "writes are careful"→"guarded"; "keeps the design honest"→"keeps the design aligned with the domain"; "reaches further than the product uses"→"provides more than"; "data lives"→"data is stored"; "text lives"→"appears"; "survives the application"→"independent of the application"; "documents left where they live"→"stay in the customer's storage". |
| Repeated signature phrases | **DEDUPED 2026-07-07** | "stale the moment" 3→1 (kept Intro); "entry fee" 3→1 (kept Intro; others→"up-front cost"/"avoids that cost"); "turns … from the product to …" 3× varied (Intro "shifts", Ch IV "moves … it is built on", Ch V "now concerns the framework itself"); "entry point of every capability" 2→1; "survives the application" 2→0; "meant to grow" 2→1; "deferred ambition" already 1 (earlier pass); bolt metaphor already 1 ("bolt-on", Ch I). "who approved what, when, and on which version" left as-is (problem-statement vs value-prop uses read distinctly). |
| Invented compound coinages | ~~—~~ **FIXED 2026-07-07** | 0 left. "overlay-on-incumbents"→"overlay existing systems rather than replace them"; "DACH-tailored productisation"→"DACH-first product design"; "aggregate-shaped"→"fetch whole aggregates"; "broker-fanned topology"→"topology fanned out through the message broker"; "designed-for but dark"→"anticipated in the design but not yet built". |

---

## 2. Findings by file

> **STATUS 2026-07-07 (uncommitted):** worked through §2 in full. Applied nearly all
> [high] and [med] findings plus the objective [low] ones; the handful left as-is are
> deliberate keeps, noted inline below. Also cleared all of §3 (mechanical errors +
> British/American spelling drift — "organization(s)", "center", "Modeled",
> "internationalization", "minimize", "fulfills" all fixed). Rebuilt clean: 64 pages, 0 errors.
> **Deliberately kept:** L249–251 (real point, delivery fine); the staged "let me search my
> email" quote (L254, effective colour); "Security is a property of the architecture, not a
> subsystem beside it" (Ch III, earns its place as a section thesis); the Ch II conclusion
> chiasmus (L541, standard FR/NFR framing); the §4 defensibles (thesis sentence, seams device,
> system-clock line).
>
> **FINAL READ-THROUGH 2026-07-07:** re-read all rendered prose (Intro + Ch I–III in full,
> Ch IV–V skeletons). Caught and fixed one self-inflicted bug — a dangling "The same design
> also names, through its open seams." left when "meant to grow" was deduped (Ch III conclusion,
> now "Its open seams mark where the design is built to extend."). Smoothed three repeats the
> edits had created: "worth addressing now" ×2 (Ch I intro vs conclusion), "capability, not
> implementation" ×2 (Ch II §intro vs FR intro), "every other capability" ×2 (Ch II registry vs
> IAM); plus one more "materialised"→"embodied" Gallicism (Ch III DocumentLink). Mechanical
> sweep clean: no doubled words; posture/machinery/forward-looking/materialise all 0 in rendered
> prose (remaining hits are `%` comments in the Ch IV–V skeletons). Rebuilt: 64 pages, 0 errors.

### Introduction/introduction.tex

- **L7** [med · poetic] "Contracts are the connective tissue of any business" — body-metaphor opener; a very common generated-text opening move. → "Contracts record what an organisation has committed to…" (the next clause already says it).
- **L10–12** [med · journalistic] "has remained a stubbornly manual affair, even as the rest of the back office has moved online" — magazine tone. → "is still largely manual".
- **L12–13** [low · idiom] "the regulatory bar has risen".
- **L33–34** [med · repeat] "a manual exercise that is stale the moment it is finished" — 1st of 3 uses of the "stale the moment" line.
- **L37–38** [med · metaphor] "an entry fee that pushes mid-market buyers back to spreadsheets and email" — 1st of 3 "entry fee" uses.
- **L48–49** [med · idiom] "a property of the storage model rather than a feature bolted on top" — bolt metaphor #1 + "rather than".
- **L52–54** [high · poetic] "The remaining internship effort then turns inward, from the product to the event-sourced system beneath it, in a forward-looking engineering study" — "turns inward" + "beneath it" + "forward-looking" in one sentence; and the formula recurs verbatim-ish in Ch IV and Ch V conclusions/intros.
- **L73–74** [med · Gallicism] "opens the perspectives for the work that follows" — calque of "ouvre les perspectives"; unidiomatic in English. → "and sets out perspectives for future work".

### Chapter1/chapter1.tex

- **L21–22** [med · consultant-speak] "pressures that make this market actionable today" — an "actionable market" is jargon. → "…that make this market worth addressing now". (Echoed at L436–437.)
- **L37** [low · marketing] "operating under the banner of *Machine Learning Excellence*" — if that is G0's real motto, keep the motto but drop "under the banner of" ("whose motto is…").
- **L39–40** [low · consultant-speak] "extract value from highly sensitive data".
- **L49** [med · marketing] "round out the offering" — brochure language. → "complete the portfolio".
- **L66–67** [med · consultant-speak] "comby is the company's strategic answer to the build-versus-buy question".
- **L68–71** [med · informal metaphor] "the same plumbing for audit trails … makes that plumbing a shared asset" — "plumbing" twice; blog register. → "infrastructure" / "foundations".
- **L73–75** [high · convoluted+poetic] "Around comby sits a broader engineering identity, visible across the privacy-first portfolio and inherited directly by CLMPilot, that concentrates on three threads." — abstract nouns stacked on a spatial metaphor; hard to parse. → "Three engineering principles recur across Gradient Zero's products, and CLMPilot follows them."
- **L75–85** [high · coinage] the triad "*compliance-by-architecture*", "*overlay-on-incumbents*", "*DACH-tailored productisation*" — invented hyphenated jargon, "overlay-on-incumbents" especially. Unpack: "products overlay the customer's existing storage and applications instead of replacing them", etc.
- **L131** [low · word choice] "This bracket has two properties" — "bracket" → "segment".
- **L140–141** [med · poetic] "a present concern for Mittelstand decision-makers rather than a deferred ambition" — near-duplicated at L436–437 ("an actionable need rather than a deferred ambition"). Keep at most one.
- **L169** [med · vague] "Taken together, these pressures define a moving baseline" — "Taken together" is a stock connective and "moving baseline" is undefined. → "These pressures are pushing companies that managed informally five years ago to formalise now."
- **L171–172** [low · cute] "demanded today rather than \textit{eventually}" — italics for drama.
- **L176–178** [med · odd English] "four bands that map cleanly onto the size and geography of the buyer" + "as it presents to a DACH Mittelstand customer" — intransitive "presents" is clinical/medical usage; also in the table caption (L182–183). → "as it appears to…" / "as seen by…".
- **L199–200** [med · wordplay] table cell: "a multi-month project that absorbs the operational budget the product is supposed to release" — budget "released" by a product is strained.
- **L202–203** [med · unidiomatic] table cell: "Free at the surface; no automation, no compliance posture, no portfolio visibility." — "at the surface" → "on the surface" (or "nominally free"); triple "no X, no Y, no Z" is rhetorical anaphora.
- **L212–215** [med · AI-superlative] "bypasses that entry fee deliberately, and is the single product decision that most shapes the architectural choices" — "the single X that most Y" framing + "deliberately".
- **L249–251** [med · dramatic] "a critical business decision is taken not by the people responsible for it, but by the default behaviour of an external counterparty" — good idea, heavy delivery; echoed at L307–308 ("returning renewal decisions to the people responsible for them").
- **L257–258** [low · informal] "the answer in the absence of a CLM is *'let me search my email'*" — staged quote; fine if the jury tolerates colour.
- **L258–260** [low · personification] "they are mutable, they degrade -- through deleted accounts and expired retention windows".
- **L260–261** [med · balanced epigram] "Under GoBD, this gap is sufficient to fail an audit; under ISO~27001, it is sufficient to delay a certification." — the perfectly parallel see-saw is a generator cadence (content is fine; consider joining: "…is enough to fail a GoBD audit or delay an ISO 27001 certification").
- **L274** [low · dramatic heading] "Approval chaos" — siblings are sober ("Missed deadlines", "No audit trail"); consider "Unstructured approvals".
- **L285–288** [med · jargon] "they share a common solution shape" — "solution shape". → "they admit a common solution".
- **L301–302** [med · personification] "The documents themselves are deliberately left where they already live" — documents don't live; + "deliberately". → "remain in the customer's existing storage".
- **L318–320** [med · logic] "The methodology … was shaped by a single operating constraint: … That constraint also fixes the scope of this report." — how a staffing constraint "fixes the scope of the report" is unclear; the sentence gestures rather than states.
- **L361–362** [med · idiom] "\textit{refactoring} keeps that design honest" — personification; → "keeps the design aligned with the domain as understanding improves".
- **L375–376** [med · cute personification] "the continuous-integration gate stands in for the partner who keeps asking whether the tests still pass" — charming but very blog; the jury may like or hate it. Safer: "the continuous-integration gate provides the constant verification a pairing partner would."
- **L377** [med · theatrical] "The \textit{on-site customer} is played by the company supervisor" — "is played by" casts the supervisor as an actor in a play. → "the role of the on-site customer is filled by…".
- **L388–389** [med · unglossed metaphor] "release planning fixes what each release contains and when it leaves" — releases "leaving" only makes sense inside the train metaphor, which isn't active in that sentence. → "when it ships".
- **L399–401** [med · clunky] "The internship then moved past the product release train to a fourth, different kind of work: a forward-looking engineering effort on the event-sourced framework itself." — "a fourth, different kind of work" is filler + stock "forward-looking".
- **L424–425** [low · stiff] "attached to its motivating roadmap item" — → "to the roadmap item that motivated it".
- **L426–428** [med · rhetorical device] "the three questions a maintainer asks first: *what does it do, why is it there, and which phase of the project introduced it?*" — invented catechism; a known generated-text move ("the three questions…").
- **L436–437** [med · repeat] "an actionable need rather than a deferred ambition" — see L140–141.

### Chapter2/chapter2.tex

- **L20–21** [med · odd metaphor] "We proceed from the users inward" — spatial metaphor with no established geometry. → "We start from the users:".
- **L24 / L167–168** [med · AI-favourite word] "the most consequential scenarios" / "Three of these use cases carry the most consequential behaviour of the platform" — "consequential" twice, plus "carry … behaviour" is odd. → "most important" / "most critical".
- **L34** [low · tic] "The actor model is intentionally narrow."
- **L38–39** [med · inversion tic] "Above them sits a platform-level system administrator" — see pattern table.
- **L76** [low · dramatic] "The system clock is the fifth actor." — tagline rhythm; fine if kept alone, currently fine.
- **L132** [low · verb choice] "the time-driven reminders the system clock raises" — reminders are "sent"/"issued"; "raises" is event-loop jargon.
- **L175–176 / L340–341** [low · repeat] "the entry point of/for every other capability" twice.
- **L197–198 / L353–354** [med · Gallicism] "the file that materialises the contract" / "the document that materialises it" — legal-French calque ("matérialiser"); unusual in English. → "the file that embodies the contract" or "the contract's source document".
- **L290–292 / L390** [med · poetic+repeat] "export the audit trail in a format that survives the application" — twice; applications don't kill formats. → "a format independent of the application" (already used at L510–511, which is the better phrasing).
- **L404–405** [med · convoluted] "to answer the kind of question the problem statement identifies as routinely unanswered" — self-referential loop. → "to answer the portfolio questions raised in the problem statement".
- **L417–418** [med · jargon] "they are the everyday surface through which IAM is exercised by non-Admin users" — "everyday surface". → "the flows non-Admin users actually touch".
- **L423–424** [low · abstract] "capabilities that deepen the response to the same four pain points".
- **L433–435** [high · corporate boilerplate] "ensuring the organization monitors and fulfills all operational deliverables throughout the active lifecycle of the contract" — generic compliance-brochure phrasing, and the only sentence in the section written in American spelling ("organization", "fulfills") — it visibly wasn't written by the same hand. Rewrite in the file's own voice, e.g. "so the organisation tracks the commitments a signed contract creates — payments, reviews, renewals — for as long as it runs."
- **L519** [high · grammar] "with German maintained alongside it; Other languages could be targeted for a future expansion" — capital "Other" mid-sentence after a semicolon; "could be targeted for a future expansion" is vague passive. → "…alongside it; other languages can be added later, with translation slots reserved…".
- **L528–529** [high · grammar] "The platform was built by a single developer during a brief internship, every architectural choice had to minimize the long-term maintenance burden." — comma splice (two full sentences joined by a comma) + American "minimize". → "…during a brief internship, **so** every architectural choice had to minimise…".
- **L530–531** [high · typography+tone] `a fragmented mix of "best tools"` — straight double quotes render as two closing quotes in LaTeX (must be ``` ``best tools'' ```); "chasing a fragmented mix" is also informal. → "rather than a fragmented mix of specialised tools".
- **L535–537** [low · informal] "preventing the docs from drifting out of date" — "docs" → "documentation".
- **L541–542** [low · chiasmus] "what the platform must do and how well it must do it" — neat but formulaic.

### Chapter3/chapter3.tex

- **L36–39** [med · vague antithesis] "satisfy the platform's requirements by construction rather than through continuous development effort … we let a few core forces drive the system's foundational choices" — "continuous development effort" is a fuzzy foil; "forces" (pattern-literature term) reads poetic here and at L41 ("Three primary forces shape our approach").
- **L66** [low · elliptical] "The non-functional requirements become five drivers."
- **L72–75** [med · epigram stack] "This is the strongest driver. It rules out any design in which history can be mutated… What happened must be the primary record, not a by-product." — two verdict fragments + an antithesis aphorism in four lines.
- **L81–82** [med · dramatic jargon] "This one is non-negotiable: it is the product's differentiator."
- **L92** [med · personification maxim] "Isolation that relies on code remembering to filter by tenant will eventually fail." — code doesn't remember; also proverb cadence. → "Isolation that depends on every query filtering by tenant will eventually be broken by one that does not."
- **L97** [high · aphorism] "Every component added is one person's to carry." — reads like a proverb; the strongest single "poetic AI" line in the report. → "every added component increases the load on a single engineer."
- **L107–109** [med · epigram] "A contract's life is a sequence of events… These are facts that accumulate, not states that overwrite one another." — it's the chapter thesis, so arguably keep, but note it opens yet another "X, not Y".
- **L121** [med · cheeky] "there is no separate audit table to maintain or to fake" — "or to fake" implies fraud casually; consider "…to maintain — or to fall out of sync".
- **L126–128** [med · coinage+personification] "Reads dominate and are aggregate-shaped… Writes are rarer and careful" — "aggregate-shaped" invented compound; writes aren't "careful". → "reads are aggregations…; writes are rarer and validated."
- **L144** [med · poetic] "That is the reactor pattern, and the visible face of eventual consistency."
- **L151** [low · sports verdict] "The alternatives lose on the same driver."
- **L158 / L160** [med · register drop] "The costs are real." … "For CLM that is fine." — two colloquial fragments in one paragraph.
- **L161–162** [med · dangling reference] "mitigated here because a framework supplies the mechanics, which is the next section" — "the mechanics … which is the next section" has no valid antecedent. → "…supplies the mechanics; that framework is the subject of the next section."
- **L180–183** [low · stylish antithesis] "a thin layer of domain meaning over a thick layer of framework mechanics … comby owns the \emph{how} … CLMPilot owns the \emph{what}" — good content; just note it's two antithesis devices back-to-back (see §3 below).
- **L199** [low · verb choice] "a middleware that screens archived tenants" — "screens" → "blocks"/"filters out".
- **L218–219** [med · defensive adverb] "the alternatives that were genuinely weighed" — "genuinely" protests too much. → "the alternatives actually considered" or just "the alternatives considered".
- **L259 / L264** [high · verdict fragments] "Three points decide it." … "The choice is not close." — the two most AI-sounding sentences in the report; sports-commentary verdicts. → fold into prose: "Three considerations decided the choice…" and delete "The choice is not close."
- **L276** [med · anatomical metaphor] "so the core spine stays legible" — spine + legible mixes two metaphors. → "so the core model stays readable".
- **L283–284** [low · informal] "Identity and the audit log are absent on purpose".
- **L306–308** [med · epigram] "a deadline is something it owns, not a field it stores."
- **L323–324** [med · poetic] "the diagram is a compressed reading of a contract's audit trail" — "a compressed reading". → "a compact summary".
- **L342–344** [low] "did not bend the core model; they simply added new contexts" — "bend" + filler "simply".
- **L356–359** [med · self-congratulatory] "…is the clearest evidence that our system decomposition holds: the model extends naturally at its seams rather than at its center." — praise of one's own design as "clearest evidence"; also "center" (American). → state it factually: "the enterprise capabilities were added without modifying the four core aggregates."
- **L404–407** [high · cryptic epigrams] "Network isolation is by design. A public edge faces out; an internal network does not. … the most sensitive parts are not just access-controlled but unaddressable." — three rhetorical devices in three lines; "A public edge faces out; an internal network does not" is genuinely obscure. → "Only the reverse proxy is exposed; every other service sits on an internal network with no public address."
- **L408** [high · grammar] "the system uses SendGrid for email, Users own cloud storages for documents" — missing apostrophe and non-standard plural: → "the users' own cloud storage"; capital "U" mid-sentence.
- **L410–411** [high · coinage+jargon] "ERP systems are designed-for but dark until later work" — "designed-for" hyphenated ad-hoc compound; "dark" (as in dark launch) is insider slang. → "ERP integration is anticipated in the design but not yet implemented."
- **L417** [med · fragment] "There is one backend, not many."
- **L423–424** [med · dramatic] "an explicit, regenerated artefact rather than a silent risk" — "silent risk" thriller tone.
- **L430** [med · epigram] "Security is a property of the architecture, not a subsystem beside it."
- **L435–436** [med · self-satisfied] "the compliance posture, which proves to be mostly a restatement of structure already in place" — the design grading itself again (cf. L356–359, L525).
- **L464** [med · triple tic] "comby's account and session machinery owns this surface." — machinery + owns + surface in five words.
- **L466–467** [med · not-but + personification] "authorisation is not a gate the application must remember to call but a stage every request passes through."
- **L500** [med · epigram] "No single control is trusted to be enough."
- **L505–507** [med-high · poetic density] "Beneath them sits the isolation the whole compliance posture leans on, and at the core the immutable event log that is at once the system of record and the audit trail." — inversion + "leans on" + "at once X and Y" in one sentence.
- **L525** [med · idiom] "The compliance posture falls out of the architecture." — maths-slang "falls out of"; to a non-engineer it reads as "collapses". → "follows directly from".
- **L533** [med · AI-ish] "One tension is worth naming" — cousin of "it is worth noting". → "One tension deserves attention" or just state it.
- **L536–537** [med-high · epigram] "The record that something happened survives; the personal data within it does not." — second use of the identical "X …; Y does not" mould (see L404–405).
- **L544–548** [high · abstract antithesis] "Internationalisation is an architectural decision, not a file format" + "Treating an extra language as deferred content, not deferred capability, keeps its later activation cheap." — two dense not-X-but-Y constructions; "deferred content, not deferred capability" is exactly the sort of compressed abstraction that screams generated text. → "Support for another language is designed in from the start; only the translations themselves are deferred, so activating a new language later is cheap."
- **L550** [low · personification] "Human-readable text lives in two places, one per process."
- **L554–555** [med · chiasmus] "so the language a user reads is the language the platform writes back in."
- **L565–566 / L612–613** [med · repeat+organic metaphor] "It also fixes where that structure is meant to grow." / "where it is meant to grow" — twice within one chapter.
- **L578** [high · typo] "is left open here fro the moment" — "fro" → "for". (Also "left open here for the moment" is filler — "remains open" suffices.)
- **L584** [low · clipped] "this is the right trade" — → "trade-off".
- **L587–588** [med · coinage] "the multi-instance, broker-fanned topology" — "broker-fanned" is invented. → "the multi-instance topology fanned out through the message broker".
- **L595–597** [low · FP-poetic] "which a reactor folds back onto the contract" + "The same shape -- fetch, extract, event-source the result, enrich a domain object -- generalises" — "folds back onto", "shape", and "event-source" verbed, all in one breath.
- **L607–608** [med · odd] "which is what lets us cover the platform's requirements over a small custom surface" — "over a small custom surface" is compressed to the point of obscurity. → "with only a small amount of custom code".
- **L611** [low · jargon] "a polyrepo, single-backend topology" — "polyrepo" is insider slang; "multi-repository" is safer in a report.
- **L616** [high · typo] "the deliveries of the project : foundations" — space before the colon (French typography); also "deliveries" → "the work delivered" / "deliverables".
- **L450** [high · typo+redundant] caption "The IAM : identity and access model." — space before colon again, and IAM already abbreviates the phrase that follows. → "The identity and access model."

### Chapter4/chapter4.tex (written prose only)

- **L40–41** [low · defensive adverb] "as it was actually built and shipped" — "actually" implies someone doubted it.
- **L167–168** [med · repeat] "the engineering effort turns from the product to the framework beneath it" — 2nd of 3 uses of the turns-from-the-product formula.

### Chapter5/chapter5.tex

- **L59–61** [med · repeat] "the remaining engineering effort turns from the product to the event-sourced system it runs on" — 3rd use of the formula, plus "forward-looking" again at L61. Vary at least two of the three sites.

---

## 3. Bonus: mechanical errors found along the way (must-fix regardless of style)

1. **Ch III L578** — typo "fro the moment" → "for".
2. **Ch II L528–529** — comma splice ("…internship, every architectural choice…") → add "so".
3. **Ch II L519** — "…alongside it; Other languages…" → lowercase "other".
4. **Ch II L531** — straight quotes `"best tools"` render wrong in LaTeX → ``` ``best tools'' ``` (or reword).
5. **Ch III L408** — "Users own cloud storages" → "the users' own cloud storage".
6. **Ch III L616 and L450 (caption)** — space before colon ("project :", "The IAM :").
7. **British/American spelling drift** (report is otherwise British: organisation, realised, artefact, internationalisation):
   - "organization(s)" — Ch II L434; Ch III L48, L350, L352
   - "center" — Ch III L359 · "Modeled" — Ch III L347 · "internationalization" — Ch III L57
   - "minimize" — Ch II L529 · "fulfills" — Ch II L434
8. **Ch III L161–162** — "the mechanics, which is the next section" — broken antecedent (see finding above).

---

## 4. Defensible — flagged only for awareness

Stylish lines that are *borderline* AI-cadence but arguably earn their keep. Keep them
only if the surrounding tics (section 1) are thinned, otherwise they'll be read as part
of the pattern:

- "CLMPilot is a thin layer of domain meaning over a thick layer of framework mechanics" (Ch III L180–181)
- "the audit trail \emph{is} the event log — there is no separate audit table to maintain" (Ch III L119–121, minus "or to fake")
- "A contract's life is a sequence of events… facts that accumulate, not states that overwrite one another" (Ch III L107–109) — the chapter's thesis sentence
- "The system clock is the fifth actor." (Ch II L76)
- The «seams» device itself (Ch III §8 ↔ Ch V) — keep as a named concept, reduce incidental uses.

## Suggested triage order

1. Section 3 (mechanical errors) — objective bugs.
2. The three [high] AI-verdict/aphorism clusters: Ch III L259/L264, L97, L404–411, L544–548; Ch I L73–85; Intro L52–54.
3. Deduplicate the repeated signature phrases (section 1, last rows).
4. Then thin the global tics ("rather than", fragments, em-dashes, surface/posture/machinery) on a read-through pass.
