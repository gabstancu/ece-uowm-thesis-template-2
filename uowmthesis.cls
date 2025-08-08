\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uowmthesis}[2025/08/08 Clean thesis class (EL/EN)]

% ---------- CLASS OPTIONS ----------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{report}

% ---------- LANG + CORE PKGS ----------
\RequirePackage{polyglossia}
\setmainlanguage{greek}
\setotherlanguage{english}

\RequirePackage{settings}


\AtBeginDocument{%
  \addto\captionsenglish{%
    \renewcommand{\chaptername}{Chapter}%
    \renewcommand{\contentsname}{Contents}%
    \renewcommand{\bibname}{Bibliography}%
    \renewcommand{\appendixname}{Appendix}%
    \renewcommand{\listalgorithmname}{List of Algorithms}%
    \renewcommand{\algorithmname}{Algorithm}%
    \renewcommand{\listfigurename}{List of Figures}%
    \renewcommand{\listtablename}{List of Tables}%
    \renewcommand{\listimagename}{List of Images}%
    \renewcommand{\acronymname}{Acronyms}%
    \renewcommand{\imagename}{Image}%
    \renewcommand{\theoremname}{Theorem}%
    \renewcommand{\lemmaname}{Lemma}%
    \renewcommand{\definitionname}{Definition}%
    \renewcommand{\corollaryname}{Corollary}%
    \renewcommand{\propositionname}{Proposition}%
    \renewcommand{\examplename}{Example}%
    \renewcommand{\remarkname}{Remark}%
  }
  \addto\captionsgreek{%
    \renewcommand{\chaptername}{Κεφάλαιο}%
    \renewcommand{\contentsname}{Περιεχόμενα}%
    \renewcommand{\bibname}{Βιβλιογραφία}%
    \renewcommand{\appendixname}{Παράρτημα}%
    \renewcommand{\listalgorithmname}{Κατάλογος Αλγορίθμων}%
    \renewcommand{\algorithmname}{Αλγόριθμος}%
    \renewcommand{\listfigurename}{Κατάλογος Σχημάτων}%
    \renewcommand{\listtablename}{Κατάλογος Πινάκων}%
    \renewcommand{\listimagename}{Κατάλογος Εικόνων}%
    \renewcommand{\acronymname}{Ακρωνύμια}%
    \renewcommand{\imagename}{Εικόνα}%
    \renewcommand{\theoremname}{Θεώρημα}%
    \renewcommand{\lemmaname}{Λήμα}%
    \renewcommand{\definitionname}{Ορισμός}%
    \renewcommand{\corollaryname}{Πόρισμα}%
    \renewcommand{\propositionname}{Πρόταση}%
    \renewcommand{\examplename}{Παράδειγμα}%
    \renewcommand{\remarkname}{Παρατήρηση}%
  }
}

% ---------- FONTS / LAYOUT (more at https://tug.org/FontCatalogue/) ----------
% \RequirePackage{lmodern} % main font
% \RequirePackage{mathptmx} % Times font + math support (legacy)
% \RequirePackage{newtxtext,newtxmath} % Modern Times clone (recommended)
% \RequirePackage{mathpazo} % Palatino + math support
% \RequirePackage{helvet} % Helvetica
% \RequirePackage{accanthis}
% \RequirePackage{libertinus}
\RequirePackage{XCharter}
\RequirePackage{microtype}
\RequirePackage[a4paper,top=3.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
\RequirePackage{setspace}
\onehalfspacing
\setlength{\parindent}{0pt}

% ---------- HEADERS / FOOTERS ----------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markboth{\thesection\quad#1}{}}
\renewcommand{\subsectionmark}[1]{}
\fancypagestyle{noheaderstyle}{%
  \fancyhf{}\fancyfoot[C]{\thepage}\renewcommand{\headrulewidth}{0pt}%
}

% ---------- COMMON PKGS ----------
\let\eth\relax
\let\backepsilon\relax
\RequirePackage{amsmath,amssymb,amsthm,mathtools}
\RequirePackage{algpseudocode}
\RequirePackage{titlesec}
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{chngcntr}
\RequirePackage{float}

% ---------- IMAGE FLOAT + LIST ----------
\floatstyle{plain}
\newfloat{image}{htbp}{loi}
\floatname{image}{\imagename} % language-sensitive at call time

\makeatletter
\newcommand{\listofmyimages}{%
  \@starttoc{loi}%
}
\newcommand*\l@image{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother

% Section-based numbering
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\theimage}{\thechapter.\arabic{image}}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{image}{section}

% ---------- ALGORITHMS FLOAT + LIST ----------
\newcounter{myalgorithm}[chapter]
\renewcommand{\themyalgorithm}{\thechapter.\arabic{myalgorithm}}

\makeatletter
\newenvironment{myalgorithm}[2]{% #1=title, #2=label
  \refstepcounter{myalgorithm}%
  \addcontentsline{loa}{myalgorithm}{\protect\numberline{\themyalgorithm}{\ignorespaces #1}}%
  \vspace{\baselineskip}\hrule\vspace{0.2em}%
  \noindent{\textbf{\algorithmname~\themyalgorithm} -- #1}%
  \vspace{0.2em}\hrule\label{#2}\vspace{0.3em}%
}{%
  \vspace{0.3em}\hrule\vspace{\baselineskip}%
}
\newcommand{\listofmyalgorithms}{%
  \chapter*{\listalgorithmname}% language-sensitive at call time
  \@starttoc{loa}%
}
\newcommand*\l@myalgorithm{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother

% ---------- LISTS ----------
\newcommand{\listofalgorithms}{%
  \cleardoublepage
  \listofmyalgorithms
  \newpage
}

\newcommand{\listofimages}{%
  \cleardoublepage
  \chapter*{\listimagename}%
  \listofmyimages
  \newpage
}

\newcommand{\listofacronyms}{%
  \cleardoublepage
  \phantomsection
  \chapter*{\acronymname}%
  \addcontentsline{toc}{chapter}{\acronymname}%
  \glsaddall%
  \begingroup
    \def\glossarysection[##1]##2{}%
    \printglossary[type=\acronymtype,title={\acronymname}]%
  \endgroup
}

% ---------- BIBLIOGRAPHY (biblatex) ----------
\RequirePackage[backend=biber, style=ieee, sorting=nyt, doi=true, url=true]{biblatex}
\newcommand{\custombibliography}{%
  \begingroup
    \let\origclearpage\clearpage
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \newpage
    \chapter*{\bibname}
    \vspace{0.75cm}
    \renewcommand{\bibname}{}%
    \printbibliography[heading=none]
    \let\clearpage\origclearpage
  \endgroup
  \markboth{\bibname}{}
}

% ---------- THEOREMS ----------
\newtheorem{theorem}{\theoremname}[chapter]
\newtheorem{lemma}[theorem]{\lemmaname}
\newtheorem{definition}[theorem]{\definitionname}
\newtheorem{corollary}[theorem]{\corollaryname}
\newtheorem{proposition}[theorem]{\propositionname}
\newtheorem{example}{\examplename}[chapter]
\newtheorem{remark}{\remarkname}[chapter]

% ---------- HYPERREF ----------
\hypersetup{colorlinks=true,linkcolor=black,urlcolor=black,citecolor=black,pdfborder={0 0 0}}

\endinput\RequirePackage{microtype}
\RequirePackage[a4paper, top=3.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}
\setlength{\parindent}{0pt}
\RequirePackage{setspace}
\onehalfspacing

% ======================== Headers/Footers ======================
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markboth{\thesection\quad#1}{}}
\renewcommand{\subsectionmark}[1]{}
\fancypagestyle{noheaderstyle}{%
  \fancyhf{}\fancyfoot[C]{\thepage}\renewcommand{\headrulewidth}{0pt}
}

% ======================== Packages (math, algos, etc.) ======================
\let\eth\relax
\let\backepsilon\relax
\RequirePackage{amsmath,amssymb,amsthm,mathtools}
\RequirePackage{algpseudocode}
\RequirePackage{titlesec}
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{chngcntr}
\RequirePackage{float}

% ======================== Custom image float ======================
\floatstyle{plain}
\newfloat{image}{htbp}{loi}
\floatname{image}{\imagename} % will expand to current language at use time
% \newcommand{\listofmyimages}{\@starttoc{loi}}
\newcommand{\listofmyimages}{%
  \begingroup
    \selectlanguage{\main@language}%
    \@starttoc{loi}%
  \endgroup
}

\newcommand*\l@image{\@dottedtocline{1}{1.5em}{2.3em}}

% Section-based numbering for floats
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\theimage}{\thechapter.\arabic{image}}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{image}{section}

% ========== ALGORITHMS ==========
\newcounter{myalgorithm}[chapter]
\renewcommand{\themyalgorithm}{\thechapter.\arabic{myalgorithm}}

\makeatletter
\newenvironment{myalgorithm}[2]{% #1 = title, #2 = label
  \refstepcounter{myalgorithm}%
  \addcontentsline{loa}{myalgorithm}{\protect\numberline{\themyalgorithm}{\ignorespaces #1}}%
  \vspace{\baselineskip}\hrule\vspace{0.2em}
  \noindent{\textbf{\algorithmname~\themyalgorithm} -- #1}%
  \vspace{0.2em}\hrule\label{#2}\vspace{0.3em}
}{%
  \vspace{0.3em}\hrule\vspace{\baselineskip}
}

% \newcommand{\listofmyalgorithms}{%
%   \chapter*{\listalgorithmname}%
%   \@starttoc{loa}%
% }

\newcommand{\listofmyalgorithms}{%
  \begingroup
    \selectlanguage{\main@language}%
    \chapter*{\listalgorithmname}%
    \@starttoc{loa}%
  \endgroup
}

\newcommand*\l@myalgorithm{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother

% ============== LISTS (language-sensitive at call time) =============
\newcommand{\listofalgorithms}{%
  \cleardoublepage
  \listofmyalgorithms
}

\newcommand{\listofimages}{%
  \cleardoublepage
  \chapter*{\listimagename}%
  \listofmyimages
}

\newcommand{\listofacronyms}{%
  \cleardoublepage
  \phantomsection
  \chapter*{\acronymname}%
  \addcontentsline{toc}{chapter}{\acronymname}%
  \glsaddall%
  \begingroup
    \def\glossarysection[##1]##2{}%
    \printglossary[type=\acronymtype,title={\acronymname}]%
  \endgroup
}

% ========== BIBLIOGRAPHY (biblatex + biber) ==========
\RequirePackage[backend=biber,style=ieee,sorting=nyt,doi=true,url=true]{biblatex}
% user: \addbibresource{references.bib}
\newcommand{\custombibliography}{%
  \begingroup
    \let\origclearpage\clearpage
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \newpage
    \chapter*{\bibname}
    \vspace{0.75cm}
    \renewcommand{\bibname}{}%
    \printbibliography[heading=none]
    \let\clearpage\origclearpage
  \endgroup
  \markboth{\bibname}{}
}

% ========== THEOREMS ==========
\newtheorem{theorem}{\theoremname}[chapter]
\newtheorem{lemma}[theorem]{\lemmaname}
\newtheorem{definition}[theorem]{\definitionname}
\newtheorem{corollary}[theorem]{\corollaryname}
\newtheorem{proposition}[theorem]{\propositionname}
\newtheorem{example}{\examplename}[chapter]
\newtheorem{remark}{\remarkname}[chapter]

% ========== HYPERREF ==========
\hypersetup{colorlinks=true,linkcolor=black,urlcolor=black,citecolor=black,pdfborder={0 0 0}}

\endinput\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{chngcntr}
\RequirePackage{fancyhdr}


\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markboth{\thesection\quad#1}{}}
\renewcommand{\subsectionmark}[1]{}

\fancypagestyle{noheaderstyle}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\RequirePackage{float}
\floatstyle{plain}
\newfloat{image}{htbp}{loi}
\floatname{image}{\imagename}

\newcommand{\listofmyimages}{%
  \@starttoc{loi}%
}

\newcommand*\l@image{\@dottedtocline{1}{1.5em}{2.3em}}

% Section-based numbering for floats
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\theimage}{\thechapter.\arabic{image}}

\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{image}{section}


% ========== ALGORITHMS ==========
% Algorithm counter
\newcounter{myalgorithm}[chapter]
\renewcommand{\themyalgorithm}{\thechapter.\arabic{myalgorithm}}

% Custom algorithm environment
\makeatletter
\newenvironment{myalgorithm}[2]{% #1 = title, #2 = label
    \refstepcounter{myalgorithm}%
    \addcontentsline{loa}{myalgorithm}{\protect\numberline{\themyalgorithm}{\ignorespaces #1}}%
    \vspace{\baselineskip}%
    \hrule
    \vspace{0.2em}
    \noindent{\textbf{\algorithmname~\themyalgorithm} -- #1}%
    \vspace{0.2em}%
    \hrule
    \label{#2}%
    \vspace{0.3em}%
}{%
    \vspace{0.3em}%
    \hrule
    \vspace{\baselineskip}%
}

% List of Algorithms output
\newcommand{\listofmyalgorithms}{%
  \chapter*{\listalgorithmname}%
  \@starttoc{loa}%
}

% Formatting the list entries
\newcommand*\l@myalgorithm{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother


% ============== LISTS =============
\newcommand{\listofalgorithms}{%
  \cleardoublepage
  % \chapter*{\listalgorithmname}%
  % \addcontentsline{toc}{chapter}{\listalgorithmname}
  \listofmyalgorithms
}


\newcommand{\listofimages}{%
  \cleardoublepage
  \chapter*{\listimagename}%
  \listofmyimages
}

% ========== BIBLIOGRAPHY ==========
\RequirePackage[backend=biber,style=ieee,sorting=nyt,doi=true,url=true]{biblatex}

\newcommand{\custombibliography}{%
    \begingroup
        \let\origclearpage\clearpage
        \let\clearpage\relax
        \let\cleardoublepage\relax
        \phantomsection
        
        \addcontentsline{toc}{chapter}{\bibname}
        \newpage
        
        \chapter*{\bibname}
        \vspace{0.75cm}
        \renewcommand{\bibname}{}
        \begin{otherlanguage*}{english} % <-- force English locale for entries
          \printbibliography[heading=none]
        \end{otherlanguage*}
        \let\clearpage\origclearpage
    \endgroup
    \markboth{\bibname}{}
}

% ========== THEOREMS ==========

\newtheorem{theorem}{\theoremname}[chapter]
\newtheorem{lemma}[theorem]{\lemmaname}
\newtheorem{definition}[theorem]{\definitionname}
\newtheorem{corollary}[theorem]{\corollaryname}
\newtheorem{proposition}[theorem]{\propositionname}
\newtheorem{example}{\examplename}[chapter]
\newtheorem{remark}{\remarkname}[chapter]


% ========== HYPERREF ==========
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    citecolor=black,
    pdfborder={0 0 0}
}

\endinput