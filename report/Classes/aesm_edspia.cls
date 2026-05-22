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
\renewcommand{\sectionmark}[1]{\markright{\thechapter.\thesection~ #1}}
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

% -------- Cover page --------------------------------------------------------
\newcommand{\makethese}{%
  \addtolength{\hoffset}{-0.5cm}%
  \thispagestyle{empty}%
  \baselineskip=13pt
  \vspace*{-4cm}

  \begin{center}\includegraphics[scale=0.05]{insat.jpg}\end{center}

  \begin{center}
    \hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}%
    \setlength{\baselineskip}{20pt}~\\
    {\Large{National Institute of Applied Sciences and Technology}}\\[\baselineskip]
    CARTHAGE UNIVERSITY\\[\baselineskip]
    {\Large{\textbf{Graduation Project}}}\\[\baselineskip]

    Specialty: \textbf{\MakeUppercase{\FILIERE}}\\[\baselineskip]

    \hbox{\raisebox{0.2em}{\vrule depth 0pt height 3.5pt width 17cm}}%
    \setlength{\baselineskip}{4pt}%
    \hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}%
    \setlength{\baselineskip}{10pt}~\\
    \vspace*{-26pt}
    {\Large\textbf{\begin{spacing}{1}\TITREPROJET\end{spacing}}}~\\[\baselineskip]
    \hbox{\raisebox{0.4em}{\vrule depth 0pt height 1pt width 17cm}}~\\[\baselineskip]

    Presented by~\\[\baselineskip]
    \baselineskip=15pt
    \AUTEURS\\[\baselineskip]
    \begin{tabular}{l@{\protect\hspace{0.2cm}}l@{\protect\hspace{0.7cm}}l}
      INSAT Supervisor   & : &\textbf{\ENCADRANT}\\
      Company Supervisor & : &\textbf{\ENCADRANTSoc}
    \end{tabular}\\[\baselineskip]
    Presented on: \textbf{\DATE}\\[\baselineskip]

    \JURY
    ~\\[\baselineskip]~\\[\baselineskip]
    Academic Year: \ANNEEUNIV\\
  \end{center}
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
