# Document structure

How the report is wired together: title, TOC, Introduction, body, Conclusion.

## Title of the project

From the original 2013 guide (and explicitly _not_ in the template appendix):

> The project title should be concise but clear, short but explicit. Avoid generic
> titles like "Building an application"; prefer "Building an application for
> managing $\ldots$ with $\ldots$".

A good title names **what the application does** and **what technique or context
sets it apart**, in roughly 8–14 words. If the only thing your title says is the
verb ("Design", "Implementation", "Study"), you have a placeholder, not a title.

## Table of Contents

> The Table of Contents is the first thing a reviewer reads.

Rules:

- **Detailed enough** — but not too detailed. Three numbering levels usually suffice
  (e.g. 1.2.3, never 1.2.3.4.5).
- **Balanced across chapters.** The Introduction and Conclusion are naturally shorter
  than body chapters — that is expected. But the body chapters themselves should be
  roughly comparable in weight.
- **Descriptive titles.** Avoid generic placeholders like `Design`. Prefer:
  *"Design of the management application for $\ldots$"*. Slightly longer titles
  are better than an impersonal summary.
- **No empty single-child levels.** If you have a section 1.1 but no 1.2, drop the
  numbering and merge 1.1 back into 1. Same for subsections.
- **Always auto-generated.** Use your editor's automatic styles and let the TOC
  build itself — never type it by hand. With LaTeX this is `\tableofcontents`;
  the template already wires it up.

## Introduction (general)

Always **prose, not bullet points.** Four-part structure:

1. **Context** — the general domain of your application. Web? BI? Enterprise
   software? Embedded?
2. **Problem statement** — what specific needs in that context motivate this
   project? What is broken / missing / inefficient today?
3. **Contribution** — short description of your application, *without* implementation
   detail. The introduction *introduces* the work — it does not summarize it.
4. **Report outline** — the chapters and what each one covers. Prefer linked
   paragraphs over a numbered list.

## Body chapters

Typical PFE has three:

| Chapter | Role |
|---|---|
| Theoretical study | State of the art and/or study of the existing system. |
| Design | Methodology + UML diagrams (use-case, class, sequence). |
| Implementation | Tools, walkthrough, key snippets, comparison tables. |

Each chapter starts with an introduction and ends with `\section*{Conclusion}`
— both unnumbered and absent from the TOC. The original guide is specific:

> Every chapter must have an introduction and a conclusion. There is no need to
> write the word "Introduction" — the fact that it sits before the section titles
> shows it's an intro — but you _must_ write "Conclusion". Neither is numbered,
> neither appears in the table of contents.

The template plays it safe and uses `\section*{Introduction}` explicitly. Either
convention is accepted at INSAT.

Per-chapter conclusion = short recap of the chapter + one-sentence lead-in to the
next.

## Conclusion (whole report)

Two parts only:

1. **Recap** of your contribution, the tools used, the methodology. You can also
   mention difficulties encountered.
2. **Perspectives** — features that could be added, directions for future improvement.

What does **not** belong:

> What we don't want to see here is how rewarding the internship was, how it taught
> you to integrate, what the working world is like, etc. Nobody cares — at least
> not in this section. That belongs in Acknowledgements or Dedication.

## Appendix

Anything that supports the body but breaks its flow:

- Long code listings.
- Installation / configuration steps.
- Large diagrams or screenshots.
- Glossary if you have many abbreviations.

Figures and tables in the appendix should be re-counted (`A.1`, `A.2`, …) and not
appear in the body's List of Figures / List of Tables.
