\ProvidesClass{k-cv}[2015/11/29 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass[11pt]{article}

% to avoid warnings, copy only one symbol from stmaryrd
\DeclareSymbolFont{stmry}{U}{stmry}{m}{n}
\DeclareMathSymbol\rightarrowtriangle\mathrel{stmry}{"5F}
\renewcommand{\to}{\textrightarrow\hspace{3pt}}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{black}{RGB}{0,0,0}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{dark-blue}{HTML}{0000FF}
\definecolor{maroon}{HTML}{800000}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{dark-blue}{gray}
  \colorlet{maroon}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{black}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage{microtype}
\RequirePackage[default]{lato}

% \newcommand{\normalfont}{\fontseries{l}\selectfont}
\newcommand{\bodyfont}{\fontseries{l}\selectfont}
\newcommand{\thinfont}{\fontseries{el}\selectfont}
\newcommand{\headingfont}{\fontseries{b}\selectfont}

\RequirePackage[none]{hyphenat} % No hyphenation

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}
\RequirePackage{xargs}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
\begin{tikzpicture}[remember picture,overlay]
  \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
  minimum height=30mm, yshift=8mm] (box) at (current page.north){};
  \node [anchor=center] (name) at (box) {%
  \fontsize{18pt}{36pt}\color{header}%
  {\thinfont #1}{\bodyfont  #2}
  };
  \node [anchor=north] at (name.south) {%
  \fontsize{14pt}{24pt}\color{header}%
  \bodyfont\HUGE #3%
  };
\end{tikzpicture}
}

\newcommand{\smallheader}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
minimum height=2cm, yshift=0.5mm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{24pt}{36pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
  \end{tikzpicture}
  \vspace{0.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        red\or%
        blue\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        maroon\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \Large\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{0.2\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty} % removes page number

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
%\newenvironment{entrylist}{%
%  \begin{longtable}{ | p{1\textwidth} }
%}{%
%  \end{longtable}
%}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\role}[2]{
    {#1}
    \hfill%
    {\footnotesize\color{gray} \bodyfont #2}%

}
\newcommand{\entry}[2]{
    \textbf{#1}\\
    {#2}\vspace{1.2\parsep}
}\\

\newcommand{\entrynormal}[1]{\parbox[t]{13.5cm}{
	\vspace{-1.5\parsep}
    {#1}\vspace{\parsep}%
  }\\}

\newcommand{\entrysmall}[2]{
    {#1}%
    \hfill%
    {\footnotesize\color{gray} \bodyfont #2}\vspace{\parsep}
\\}

\newcommand{\entryinfo}[1]{\parbox[t]{13.5cm}{%
    \large\headingfont\color{headercolor}%
    \@sectioncolor #1
}}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[a4paper,left=1.5cm,top=1.5cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{enumitem}
\RequirePackage[urlbordercolor=brown,pdfborder={0 0 .6}]{hyperref}
%%%%%%%%%%%%%%%%
% Self Added %
%%%%%%%%%%%%%%%%
\RequirePackage[none]{hyphenat}
\RequirePackage{multicol}
\RequirePackage{textcomp}
\RequirePackage{relsize}

\setitemize[0]{leftmargin=*}
\newenvironment{infoitemize}
{\begin{itemize}[topsep=1.5pt, parsep=0.5pt,itemsep=1pt]}
{\end{itemize}}
