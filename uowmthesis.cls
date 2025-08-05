\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mytemplate}[2025/08/05 Custom Thesis Template Class]

% ========== BASE CLASS ==========
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{report}

% ===================== Language and Encoding ==================
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,greek]{babel}

% ========== LANGUAGE SETTINGS ==========
\AtBeginDocument{%
  \addto\captionsenglish{%
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
    \renewcommand{\remarkname}{Observation}%
  }

  \addto\captionsgreek{%
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

% ======================== Fonts and Typography ======================
% \RequirePackage{XCharter}
% \RequirePackage{tgpagella} % kalo kalo
% \RequirePackage{lmodern} % Modern Latin font
% \RequirePackage{cmbright}
\RequirePackage{libertinus}
% \RequirePackage{sectsty}
\RequirePackage{microtype} % Better spacing
\RequirePackage[a4paper,top=3.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}
\setlength{\parindent}{0pt}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath, amssymb, amsthm, mathtools}
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

% ========== ALGORITHMS ==========
% Algorithm counter
\newcounter{myalgorithm}[chapter]
\renewcommand{\themyalgorithm}{\thechapter.\arabic{myalgorithm}}

% Provide default English label (override via \addto\captions...)
\providecommand{\algorithmname}{Algorithm}

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
  % \chapter*{\listalgorithmname}%
  \@starttoc{loa}%
}

% Formatting the list entries
\newcommand*\l@myalgorithm{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother


% ============== LISTS =============
\newcommand{\listofalgorithms}{%
  \cleardoublepage
  \chapter*{\listalgorithmname}%
  % \addcontentsline{toc}{chapter}{\listalgorithmname}
  \listofmyalgorithms
}


\newcommand{\listofimages}{%
  \cleardoublepage
  \chapter*{\listimagename}%
  \listofmyimages
}


\newcommand{\listofacronyms}{%
  \cleardoublepage
  % \addcontentsline{toc}{chapter}{\acronymname}%
  \chapter*{\acronymname}
  \glsaddall%
  \begingroup
    \def\glossarysection[##1]##2{}%
    \printglossary[type=\acronymtype, title={}]%
  \endgroup
}

% =========================== Graphics ========================
\RequirePackage{graphicx, float, tikz, forest}
\usetikzlibrary{trees, fit, positioning, backgrounds, arrows.meta, decorations.markings}


% ============================== Hyperlinks ===========================
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  urlcolor=black,
  citecolor=black,
  pdfborder={0 0 0}
}

% ============================= Captions ==========================
\RequirePackage[font=small,labelfont=bf]{caption}

% ========================== Theorems =========================
\RequirePackage{amsthm}

\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{example}{Example}[chapter]
\newtheorem{remark}{Observation}[chapter]



\endinput