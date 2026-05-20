# Example reports — INSAT GL / NetTel PFEs

Quick index of the example PDFs in the
[Google Drive folder _PFE ressources / PFE examples_][drive] you can mine for
structure, vocabulary, cover-page layout, and bibliography style.

[drive]: https://drive.google.com/drive/folders/1rdsHbJqHbznvlr_sshtcAvRvCZQ3EwKK

| Author | Year | Speciality | Lang | Topic |
|---|---|---|---|---|
| Hela CHIKHAOUI | 2017/18 | Software Engineering | EN | LogicBlox vs Apache Spark for big-data batch processing |
| Oumayma MESSOUSSI | 2018/19 | NetTel (Multimedia) | EN | Deep CNN for lung-cancer detection (Talan / Innovation Factory) |
| Ihsen BEN SALAH | 2015/16 | Génie Logiciel | FR | Collective-payment platform (lepotcommun.fr / Lakooz) |
| Ghassen BENALI | 2015/16 | Génie Logiciel | FR | Pharma competitive-intelligence web platform (PeakSource) |
| Marouane BEL HADJ SALAH | 2014/15 | Génie Logiciel | FR | Adjustment ops on the Tunis stock exchange (BVMT) |
| Wadii CHEMKHI | 2014/15 | Génie Logiciel | FR | Pre-sales workflow at Talan Tunisia |
| Chaima DERBALI | n/a | Génie Logiciel | FR | Big-data migration in real-estate domain (BonDeVisite) |

Plus three shortcut entries in the folder (`version-plagoat.pdf`, `rapport Samer.pdf`,
`Rapport PFE - Mariem Raddaoui.pdf`) — open the Drive links directly for those.

## What to study in each

When you open an example report, focus on these specific elements rather than
reading cover-to-cover:

1. **Cover page** — does it match the template's layout (jury, supervisors,
   speciality, year)? This is your sanity check that the cover-page macros are
   filled correctly.
2. **TOC** — count the depth (should be 3 levels), check chapter weights are
   balanced, check titles are descriptive (not "Conception").
3. **Introduction** — find the four parts (context / problem / contribution /
   outline). They should be paragraphs, not bullets.
4. **First diagrams** in the design chapter — are stereotypes used? Is there a
   "System" lifeline (bad)? Are there 2–3 sequence diagrams or 20 (bad)?
5. **Implementation walk-through** — count the screenshots. If there are more
   than ~8 in a single section, it's the anti-pattern the template warns about.
6. **Bibliography** — count books vs. websites. Books should win.
7. **Conclusion** — two parts (recap + perspectives), no internship-experience
   commentary.

## Recommended priority for your own writing

If you're writing in **English** and want a structural model, the best two are:

- **Hela Chikhaoui** — comparative big-data study, INSAT EN template, recent
  enough that the typography conventions are still current.
- **Oumayma Messoussi** — ML/CNN topic, with a serious state-of-the-art chapter
  on AI in healthcare. Good model for any project that includes a substantial
  theoretical study.

If you're writing in **French**, look at:

- **Ihsen Ben Salah** — clean structure, Scrum methodology, both INSAT and
  company supervisors.
- **Ghassen Benali** — explicit chapter on technical study with framework
  comparison — useful pattern for justifying your stack.
- **Marouane Bel Hadj Salah** — Scrum + agile methodology section, classic
  enterprise application structure.

## What _not_ to copy

The examples are templates of structure, not of content quality. Specifically:

- **Don't copy the acknowledgements verbatim** — the wording is everywhere
  online and reviewers notice.
- **Don't reuse another report's titles literally** — fix the "personal title"
  rule first (see [structure.md](structure.md) → Title).
- **Don't inherit weak bibliographies.** Several of the examples lean heavily on
  websites; do better.
