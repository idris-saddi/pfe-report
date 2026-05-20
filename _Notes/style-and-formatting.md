# Style & formatting

The mechanical rules — pagination, colors, language, abbreviations. Most of these
come straight from the appendix of the template.

## Pagination & layout

- A report must always be **properly paginated**. Front matter in lowercase Roman
  (`iii`, `iv`, …), body in Arabic numerals (`1`, `2`, …). The class file
  already handles this via `\frontmatter` / `\mainmatter`.
- **Never end a page with a heading.** If LaTeX ends a page on a section title,
  rephrase the previous paragraph or add a `\clearpage`.
- One-line orphans at end of chapter / page are equally bad.

## Colour & typography

- **No more than two colours** in the report. Black for body, one accent for
  highlights (links, code keywords). Anything beyond looks amateur.
- **No fancy display fonts.** The template uses Latin Modern (lmodern) — keep it.
- **Stay sober and professional.** The reviewer is grading content, not creative
  flair.
- **Recommended baseline** (from the original 2013 guide): 12pt body font, 1.5
  line spacing, justified text, an indent at the start of each paragraph. The
  template already sets 12pt and one-and-a-half spacing via `\onehalfspacing` and
  the `\documentclass` options.
- **Uniform typography across the whole report.** Use your editor's automatic
  styles — don't override font / size / colour locally. With LaTeX this is the
  default behaviour as long as you don't sprinkle `\Large` / `\textcolor`
  everywhere.

## Language & person

- **No "I", no "on" (impersonal "one").** Always **"we"** — the editorial
  plural — even if you did the project alone. This is the convention at INSAT
  and in most French/Tunisian academic writing; in English it reads as a
  measured, professional voice rather than a personal blog.
- **Short sentences.** Clear and concise is the rule. If a sentence has three
  commas and a semicolon, split it.
- **Active voice over passive** wherever possible. *"We built X"* is sharper than
  *"X was built"*.

## Foreign terms

- **Prefer English/French terms** as appropriate for the target language. If a
  term is more widely known in English (and you are writing in French), give the
  French equivalent the first time, then reuse the English word in italics:
  *workflow*, *deadline*.
- The reverse holds when writing in English: introduce a non-English term in
  italics on first use, then it's just a word.

## Abbreviations

- **Define every abbreviation on first use.** *"…the Service-Level Agreement (SLA)…"*.
  After that, use only the abbreviation.
- If you have **many** abbreviations, build a glossary at the front or in the
  appendix.
- Acronyms that are now common (HTTP, REST, API, SQL) can be used without
  expansion — but err on the side of expanding.

## Hardware / environment descriptions

> You have a tendency, when describing the hardware environment, to talk about
> your laptop — this is useless.

Mention only the hardware that **affects the application**. Whether you developed
on Windows or Ubuntu does not matter. Whether the production target is an ARM
embedded board, an x86 server with 32 GB RAM, or a Kubernetes cluster — that
matters.

## Figures and tables

| Element | Required |
|---|---|
| Caption | Yes (used in the List of Figures / Tables). |
| Label | Yes (`fig:foo`, `tab:foo`). |
| Reference in body | Yes — at least once. |
| Source attribution | If the figure is not yours, cite the source in the caption. |

From the original 2013 guide:

> Make sure your figures are numbered and referenced from the text, and that a
> List of Figures is generated. Same for tables (if there are enough of them).
>
> If an image was copied from a website or a book, it must be referenced in the
> caption.

Practical pattern in LaTeX:

```latex
\begin{figure}[!ht]\centering
  \includegraphics[scale=0.6]{architecture.png}
  \caption{System architecture. Source: \cite{Fowler2003}.}
  \label{fig:arch}
\end{figure}
```

If you redrew the figure yourself based on a source, use *"Adapted from
\cite{...}"* instead of *"Source: \cite{...}"*.

## File / project conventions in this template

- All chapters live in their own folder under the project root.
- Each chapter folder has a `figures/` subfolder; the chapter `.tex` declares
  `\graphicspath{{Chapter1/figures/}}` so you can use bare filenames in
  `\includegraphics`.
- The bibliography `.bib` lives in `Bibliography/`. The bib style is
  `Bibliography/unsrt_modif`.
- Build:
  ```
  pdflatex report && bibtex report && pdflatex report && pdflatex report
  # or
  latexmk -pdf report.tex
  ```

## Quick self-check before submission

- [ ] TOC reads sensibly on its own and uses descriptive titles.
- [ ] Every chapter has an Introduction and a Conclusion.
- [ ] Every figure and table is referenced from the body.
- [ ] Every citation in the body resolves to a bibliography entry, and vice versa.
- [ ] No undefined references / no rerun warnings in the final `pdflatex` log.
- [ ] No widows, orphans, or section titles at the bottom of a page.
- [ ] Spell-checked by a second reader (not the spell-checker, a human).
- [ ] Page numbers, headers and footers consistent across the document.
- [ ] PDF opens cleanly, bookmarks work, internal links work.
