# Bibliography

A bibliography is one of the most over-scrutinized parts of the report.

> Your bibliography must meet a number of criteria; otherwise it will get flagged
> (and sometimes flagged even when you think it shouldn't — everyone has a
> personal opinion on what makes a good bibliography).

## Composition

- **More books and articles than websites.** It's a bibliography, not a link
  collection. Prefer peer-reviewed works for definitions instead of jumping to
  Wikipedia.
- **Entries usually ordered** alphabetically, or by theme (and alphabetically
  within each theme). With `\bibliographystyle{unsrt}` they appear in citation
  order — fine, but think about whether thematic grouping would be clearer.

## Entry format

A bibliography entry always carries a **unique identifier** — either a number
`[1]` or `[FirstAuthor, Year]` (`[Kuntz, 1987]`). With BibTeX the identifier is
your `@xxx{Key,` cite key.

By source type:

| Source | Required fields |
|---|---|
| Book | Author(s), title, publisher, ISBN/ISSN, publication date. |
| Article | Author(s), title, journal or conference, publication date. |
| Website / electronic document | Title, URL, date accessed. |
| Thesis | Author, title, defending university, year, page count. |

### Examples (from the template)

> **[Bazin, 1992]** BAZIN R., REGNIER B. *Antiviral treatments and their clinical
> trials.* Rev. Prat., 1992, 42, 2, p. 148–153.
>
> **[Anderson, 1998]** ANDERSON P.JF. *Checklist of criteria used for evaluation
> of metasites.* [online]. University of Michigan, USA.
> `http://www.lib.umich.edu/megasite/critlist.html`. (Accessed 1998-09-11.)

## Citations in the body

- **Every** claim taken from a reference must cite its identifier right after the
  claim. Failing to do so is plagiarism — accidental or not.
- Cite in the form your style produces: `\cite{Bazin1992}` → `[1]` with `unsrt`,
  or `[Bazin, 1992]` with author-year styles.
- Multiple citations in one place: `\cite{Bazin1992,Anderson1998}` rather than
  `\cite{Bazin1992}\cite{Anderson1998}` — the former gets compressed by `natbib`
  with the `sort&compress` option (already enabled in this template).

## Practical workflow

- Maintain a single `.bib` file for the whole report.
- Use a tool (Zotero, JabRef, BetterBibTeX) to capture entries — do not type
  BibTeX by hand from a PDF.
- For each citation: double-check the BibTeX has the **correct title casing**
  (LaTeX downcases titles unless you wrap parts in `{Braces}`).
- Run `bibtex` between two `pdflatex` passes whenever you add or remove an entry.

## Style file

The template ships `unsrt_modif.bst` — a modified `unsrt` style (citations in
order of first appearance). If you prefer author-year, swap in `plainnat` or
`abbrvnat` (both bundled with TeX Live).
