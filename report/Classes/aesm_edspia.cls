%%==============================================================================
%% aesm_edspia.cls -- INSAT / EDSPIA graduation report class
%% English edition, modernized for TeX Live 2026 / LaTeX2e (current).
%%
%% Changes vs. legacy version:
%%   * UTF-8 only; T1 fontenc; lmodern.
%%   * Removed dead dvi/eps branch -- we target pdflatex.
%%   * Removed deprecated `hypernat'; natbib + hyperref are compatible directly.
%%   * Closed the previously unbalanced \AtBeginDocument hook (was scanning
%%     forever under modern LaTeX2e and failing the build).
%%   * All user-facing strings are English (Acknowledgements, Jury, etc.).
%%   * Cover page labels rewritten in English.
%%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Classes/aesm_edspia}[2026/05/20 v2.0 INSAT EDSPIA report (EN)]

% Pass any unknown option straight through to `book'.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper]{book}

% -------- Encoding / fonts --------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}

% -------- Core layout packages ---------------------------------------------
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{eucal}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{minitoc}

% -------- Hyperref ----------------------------------------------------------
\RequirePackage[
  pdftex,
  plainpages=false,
  pdfpagelabels=true,
  pdfpagelayout=SinglePage,
  bookmarks=true,
  bookmarksopen=true,
  bookmarksnumbered=true,
  breaklinks=true,
  linktocpage=true,
  pagebackref=true,
  colorlinks=true,
  linkcolor=blue,
  urlcolor=blue,
  citecolor=blue,
  anchorcolor=blue,
  hyperindex=true,
  hyperfootnotes=false,
  hyperfigures=true
]{hyperref}

\DeclareGraphicsExtensions{.png,.jpg,.pdf}
\pdfcompresslevel=9

% -------- A4 page geometry --------------------------------------------------
\setlength{\hoffset}{0pt}
\setlength{\voffset}{0pt}
\setlength{\evensidemargin}{0cm}
\setlength{\oddsidemargin}{0mm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{2\baselineskip}
\setlength{\headsep}{1cm}
\setlength{\textheight}{22cm}
\setlength{\textwidth}{17cm}
\setlength{\marginparsep}{0cm}
\setlength{\marginparwidth}{0cm}
\setlength{\footskip}{2.36cm}

% -------- Redefine \part with horizontal rules ------------------------------
\makeatletter
\def\@part[#1]#2{%
  \refstepcounter{part}%
  {%
    \hbox{\raisebox{0.2em}{\vrule depth 0pt height 3.5pt width 17cm}}%
    \setlength{\baselineskip}{4pt}%
    \hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}%
    \setlength{\baselineskip}{10pt}~\\
    \parindent\z@ \raggedright
    \ifnum \c@secnumdepth >\m@ne
      \Large\bfseries \partname{}~\thepart
      \par\nobreak
    \fi
    \huge\bfseries #2 \markboth{}{} \par
  }%
  \nobreak
  \vskip 3ex\@afterheading
  \hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}%
  \setlength{\baselineskip}{10pt}~\\
}
\makeatother

% -------- Running headers / footers -----------------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{{\chaptername~\thechapter.\ #1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection~ #1}}
\fancyhf{}
\fancyhead[R]{\bfseries\rightmark}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[R]{\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
}

% -------- Environments ------------------------------------------------------
\newenvironment{alwayssingle}
  {\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\else\newpage\fi}
  {\if@restonecol\twocolumn\else\newpage\fi}

\newenvironment{dedication}
  {\begin{alwayssingle}\pagestyle{empty}%
   \begin{center}\vspace*{1.5cm}{\LARGE }\end{center}\vspace{0.5cm}%
   \begin{quote}\begin{center}}
  {\end{center}\end{quote}\end{alwayssingle}}

\newenvironment{acknowledgements}
  {\pagestyle{empty}\begin{alwayssingle}%
   \begin{flushleft}\vspace*{1.5cm}{\Huge\bfseries Acknowledgements}\end{flushleft}%
   \vspace{0.5cm}\begin{quote}}
  {\end{quote}\end{alwayssingle}}

\newenvironment{abstracts}
  {\begin{alwayssingle}\pagestyle{empty}%
   \begin{flushleft}\vspace*{1.5cm}{\Large\bfseries Abstract}\end{flushleft}%
   \vspace{0.5cm}\begin{quote}}
  {\end{quote}\end{alwayssingle}}

\newenvironment{abstractslong}
  {\begin{alwayssingle}\pagestyle{empty}%
   \begin{center}\vspace*{1.5cm}{\Large\bfseries Abstract}\end{center}%
   \vspace{0.5cm}\begin{quote}}
  {\end{quote}\end{alwayssingle}}

\newenvironment{romanpages}
  {\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
  {\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

% -------- Cover-page metadata (user-facing API) -----------------------------
% Banner row at the top of the cover page, in the official INSAT layout: the
% two seals flank the ministerial address block, INSAT flush left and Carthage
% University flush right, spanning the same 17 cm as the rules underneath.
% Each piece is a separate macro so the main file can \renewcommand just one
% (swap a logo, add a host-company line) without restating the whole banner.
\newcommand{\CoverLogoLeft}{\includegraphics[height=2.7cm]{insat.jpg}}
\newcommand{\CoverLogoRight}{\includegraphics[height=2.7cm]{ucar.png}}
\newcommand{\CoverInstitution}{%
  REPUBLIC OF TUNISIA\\[0.45\baselineskip]
  Ministry of Higher Education and Scientific Research\\[0.45\baselineskip]
  University of Carthage\\[0.45\baselineskip]
  \textbf{National Institute of Applied Sciences and Technology}%
}
% \vcenter puts the square INSAT seal, the address block and the taller
% Carthage wordmark on a common midline instead of a common baseline. The
% address block is set one step down from the body size: at 12pt its longest
% line (the institute's full name, in bold) measures 11.3cm and would wrap in
% the space the two seals leave, and that name has to stay on one line.
\newcommand{\CoverHeader}{%
  \hbox to 17cm{%
    $\vcenter{\hbox{\CoverLogoLeft}}$\hfil
    $\vcenter{\hbox{\begin{minipage}{10.9cm}\centering\small\CoverInstitution\end{minipage}}}$\hfil
    $\vcenter{\hbox{\CoverLogoRight}}$}%
}

% Host organisation of the internship: shown as "Hosted by" followed by its
% logo(s), between the author's name and the supervisor block, as on the INSAT
% model cover. Empty by default -- a report with no host company then prints
% neither the label nor the gap it would leave.
%
% MIND THE COVER'S VERTICAL BUDGET: the whole cover measures ~614pt against a
% 626pt \textheight, so a taller logo here (or any line added elsewhere) has to
% be paid for by trimming a gap. Overflow is silent -- no overfull warning, the
% cover just breaks and "Academic Year" starts a second page. Measure it in a
% probe document instead of rebuilding the report:
%   \setbox0=\vbox{\hsize=\textwidth \makethese}\typeout{\the\ht0}
% Do not buy the space by making the \vspace* at the top of \makethese more
% negative: that pushes the seals towards the trim edge.
\newcommand{\CoverHostLogos}{}
% NB: this \makeatletter/\makeatother pair is only needed for \@empty below.
% In a .cls file @ is ALREADY a letter, so the \makeatother leaves it OTHER for
% everything that follows -- which is why the macros further down (\CoverBody)
% avoid @ in their names. Add no @-name after this point without wrapping it.
\makeatletter
\newcommand{\CoverHostBlock}{%
  \ifx\CoverHostLogos\@empty\else
    Hosted by~\\[0.3\baselineskip]
    \CoverHostLogos\\[0.55\baselineskip]
  \fi
}
\makeatother

\newcommand{\FILIERE}{XXXX}

\newcommand{\ENCt}{}\newcommand{\ENCn}{}\newcommand{\ENCp}{}
\newcommand{\ENCSt}{}\newcommand{\ENCSn}{}\newcommand{\ENCSp}{}

\newcommand{\PRESn}{}\newcommand{\PRESp}{}\newcommand{\PRESq}{}
\newcommand{\INVAn}{}\newcommand{\INVAp}{}\newcommand{\INVAq}{}
\newcommand{\RAPAn}{}\newcommand{\RAPAp}{}\newcommand{\RAPAq}{}
\newcommand{\RAPBn}{}\newcommand{\RAPBp}{}\newcommand{\RAPBq}{}
\newcommand{\EXAAn}{}\newcommand{\EXAAp}{}\newcommand{\EXAAq}{}
\newcommand{\EXABn}{}\newcommand{\EXABp}{}\newcommand{\EXABq}{}
\newcommand{\EXACn}{}\newcommand{\EXACp}{}\newcommand{\EXACq}{}

\newcommand{\DATE}{}
\newcommand{\ANNEEUNIV}{}
\newcommand{\TITREPROJET}{}

\newcommand{\PrenomA}{}\newcommand{\NomA}{}
\newcommand{\PrenomB}{}\newcommand{\NomB}{}
\newcommand{\PrenomC}{}\newcommand{\NomC}{}
\newcommand{\PrenomD}{}\newcommand{\NomD}{}

\newcommand{\AUTEURA}{\PrenomA\ \NomA}
\newcommand{\AUTEURB}{\PrenomB\ \NomB}
\newcommand{\AUTEURC}{\PrenomC\ \NomC}
\newcommand{\AUTEURD}{\PrenomD\ \NomD}

\newcommand{\AUTEURS}{%
  {\Large\textbf{\AUTEURA}}\\
  {\Large\textbf{\AUTEURB}}\\
  {\Large\textbf{\AUTEURC}}\\
  {\Large\textbf{\AUTEURD}}%
}

\newcommand{\ENCADRANT}{\ENCt\ \ENCn\ \ENCp}
\newcommand{\ENCADRANTSoc}{\ENCSt\ \ENCSn\ \ENCSp}

\newcommand{\JURY}{%
  \textbf{\large{\textbf{JURY}}}\\[\baselineskip]
  \begin{tabular}{l@{\protect\hspace{0.2cm}}l@{\protect\hspace{0.7cm}}l}
    \PRESn &\PRESp &(President)\\
    \RAPAn &\RAPAp &(Reviewer)
  \end{tabular}%
}

% -------- Cover page and signature page ------------------------------------
% Both pages share everything down to the host logo; each supplies its own
% tail as the argument of \CoverBody (the jury block on the cover, the
% supervisors' signature boxes on the signature page). Passing the tail in,
% rather than splitting the shared part into its own macro, keeps the whole
% page inside ONE center environment: two adjacent ones would add vertical
% space between them and the cover has no room to spare for it.
\newcommand{\CoverBody}[1]{%
  \thispagestyle{empty}%
  \baselineskip=13pt
  \vspace*{-3cm}

  \CoverHeader

  \begin{center}
    \hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}%
    \setlength{\baselineskip}{20pt}~\\
    {\LARGE{\textbf{Graduation Project}}}\\[0.7\baselineskip]
    To obtain the\\[0.5\baselineskip]
    {\LARGE{\textbf{ENGINEERING DEGREE}}}\\[0.4\baselineskip]
    {\large In Applied Sciences and Technology}\\[0.4\baselineskip]
    {\large Specialty: \FILIERE}\\[0.6\baselineskip]

    \hbox{\raisebox{0.2em}{\vrule depth 0pt height 3.5pt width 17cm}}%
    \setlength{\baselineskip}{4pt}%
    \hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}%
    \setlength{\baselineskip}{10pt}~\\
    \vspace*{-26pt}
    {\Large\textbf{\begin{spacing}{1}\TITREPROJET\end{spacing}}}~\\[\baselineskip]
    \hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}~\\[0.4\baselineskip]

    Presented by~\\[0.8\baselineskip]
    \baselineskip=15pt
    \AUTEURS\\[0.7\baselineskip]
    \CoverHostBlock
    #1
  \end{center}
}

% \hoffset is shifted here, not in \CoverBody: \addtolength is not undone at
% the end of the macro, so doing it per page would shift the signature page
% (and the rest of the report) a further 0.5cm. \makesignature therefore has
% to come after \makethese, which is also the order the pages are printed in.
\newcommand{\makethese}{%
  \addtolength{\hoffset}{-0.5cm}%
  \CoverBody{%
    \begin{tabular}{l@{\protect\hspace{0.2cm}}l@{\protect\hspace{0.7cm}}l}
      INSAT Supervisor   & : &\textbf{\ENCADRANT}\\
      Company Supervisor & : &\textbf{\ENCADRANTSoc}
    \end{tabular}\\[0.75\baselineskip]
    Presented on: \textbf{\DATE}\\[0.75\baselineskip]

    \JURY
    ~\\[0.7\baselineskip]
    Academic Year: \ANNEEUNIV\\
  }%
}

% Signature (approval) page: the cover again, with a box per supervisor to
% sign and date instead of the jury and defence date.
\newcommand{\SIGNBOXHT}{2.1cm}
\newcommand{\SignatureBoxes}{%
  \begin{tabular}{|>{\centering\arraybackslash}p{5.6cm}
                  |>{\centering\arraybackslash}p{5.6cm}|}
    \hline
    \rule{0pt}{1.4\baselineskip}Supervisor at the Company\newline
    \textbf{\ENCADRANTSoc}
    &\rule{0pt}{1.4\baselineskip}Supervisor at INSAT\newline
    \textbf{\ENCADRANT}\\[0.3\baselineskip]
    \hline
    \rule{0pt}{\SIGNBOXHT}&\\
    \multicolumn{1}{|l|}{~Date:}&\multicolumn{1}{l|}{~Date:}\\
    \hline
  \end{tabular}%
}
\newcommand{\makesignature}{%
  \CoverBody{%
    \SignatureBoxes\\[0.9\baselineskip]
    \textbf{Academic year: \ANNEEUNIV}\\
  }%
}

% -------- Setter macros (kept in French for backward compatibility) --------
\newcommand{\AuteurA}[2]{\renewcommand{\PrenomA}{#1}\renewcommand{\NomA}{#2}}
\newcommand{\AuteurB}[2]{\renewcommand{\PrenomB}{#1}\renewcommand{\NomB}{#2}}
\newcommand{\AuteurC}[2]{\renewcommand{\PrenomC}{#1}\renewcommand{\NomC}{#2}}
\newcommand{\AuteurD}[2]{\renewcommand{\PrenomD}{#1}\renewcommand{\NomD}{#2}}
\newcommand{\Filiere}[1]{\renewcommand{\FILIERE}{#1}}
\newcommand{\datesout}[1]{\renewcommand{\DATE}{#1}}
\newcommand{\AnneeUniv}[1]{\renewcommand{\ANNEEUNIV}{#1}}
\newcommand{\TitreProjet}[1]{\renewcommand{\TITREPROJET}{#1}}
\newcommand{\Encadrant}[3]{\renewcommand{\ENCt}{#1}\renewcommand{\ENCn}{#2}\renewcommand{\ENCp}{#3}}
\newcommand{\EncadrantS}[3]{\renewcommand{\ENCSt}{#1}\renewcommand{\ENCSn}{#2}\renewcommand{\ENCSp}{#3}}
\newcommand{\President}[2]{\renewcommand{\PRESn}{#1}\renewcommand{\PRESp}{#2}}
\newcommand{\Invite}[3]{\renewcommand{\INVAn}{#1}\renewcommand{\INVAp}{#2}\renewcommand{\INVAq}{#3}}
\newcommand{\RapporteurA}[2]{\renewcommand{\RAPAn}{#1}\renewcommand{\RAPAp}{#2}}
\newcommand{\RapporteurB}[3]{\renewcommand{\RAPBn}{#1}\renewcommand{\RAPBp}{#2}\renewcommand{\RAPBq}{#3}}
\newcommand{\ExaminateurA}[3]{\renewcommand{\EXAAn}{#1}\renewcommand{\EXAAp}{#2}\renewcommand{\EXAAq}{#3}}
\newcommand{\ExaminateurB}[3]{\renewcommand{\EXABn}{#1}\renewcommand{\EXABp}{#2}\renewcommand{\EXABq}{#3}}
\newcommand{\ExaminateurC}[3]{\renewcommand{\EXACn}{#1}\renewcommand{\EXACp}{#2}\renewcommand{\EXACq}{#3}}

% Convenience: align fourth cover (back-of-cover) on odd page.
\newcommand{\alignquatriemedecouv}{%
  \newpage\thispagestyle{empty}~
  \ifodd\value{page}%
    \newpage\thispagestyle{empty}%
  \else
    \newpage\thispagestyle{empty}~\newpage\thispagestyle{empty}%
  \fi
}

% Placeholder hooks (kept for back-compat with old documents that include
% material here; empty by default).
\AtBeginDocument{}
\AtEndDocument{}

\endinput
