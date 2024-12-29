%% start of file `resumeow.cls'.

%% Copyright 2024 Madhavan Raja (github.com/madhavan-raja).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.


%------------------------------
% Identification
%------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resumeow}[2014/08/16 Assignmeownt LaTeX class]


%------------------------------
% Class Options
%------------------------------

\LoadClass[10pt]{article}

\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{inconsolata}
\RequirePackage{xcolor}
\RequirePackage[inline]{enumitem}
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{listofitems}
\RequirePackage[inline]{enumitem}


%------------------------------
% Titles
%------------------------------

\newcommand*{\name}[1]{\newcommand{\@name}{#1}}
\newcommand*{\phone}[1]{\newcommand{\@phone}{#1}}
\newcommand*{\email}[1]{\newcommand{\@email}{#1}}
\newcommand*{\website}[1]{\newcommand{\@website}{#1}}
\newcommand*{\linkedin}[1]{\newcommand{\@linkedin}{#1}}

\renewcommand{\maketitle}{
    \begin{center}
        \textbf{\Large \MakeUppercase \@name}
        
        \vspace{0.5em}
        
        \begin{links}
            \IfNoValueF{\@phone}{
                \item \calllink{\@phone}
            }
            \IfNoValueF{\@email}{
                \item \maillink{\@email}
            }
            \IfNoValueF{\@website}{
                \item \cleanlink{\@website}
            }
            \IfNoValueF{\@linkedin}{
                \item \cleanlink{\@linkedin}
            }
        \end{links}
    \end{center}
}


%------------------------------
% Sections
%------------------------------

\newcommand{\ExperienceList}[1]{
    \section{Work Experience}

    \begin{categoryitems}
        #1
    \end{categoryitems}
}

\newcommand{\ProjectList}[1]{
    \section{Projects and Publications}

    \begin{categoryitems}
        #1
    \end{categoryitems}
}

\newcommand{\EducationList}[1]{
    \section{Education}
    
    \begin{categoryitemstiny}
        #1
    \end{categoryitemstiny}
}

\newcommand{\SkillList}[1]{
    \section{Technical Skills}
    
    \begin{categoryitemstiny}
        #1
    \end{categoryitemstiny}
}

\newcommand{\AchievementList}[1]{
    \section{Achievements}

    \begin{descriptionitems}
        #1
    \end{descriptionitems}
}


%------------------------------
% Resumeow
%------------------------------

\setlength{\parindent}{0pt}
\pagenumbering{gobble}

\hypersetup{
  colorlinks=true,
  linkcolor=green,
  urlcolor=blue,
}

\newcommand{\formattedlink}[1]{\texttt{#1}}

\newcommand{\calllink}[1]{\href{tel:#1}{\formattedlink{#1}}}
\newcommand{\maillink}[1]{\href{mailto:#1}{\formattedlink{#1}}}
\newcommand{\cleanlink}[1]{\href{https://www.#1}{\formattedlink{#1}}}

\titleformat{\section}
    {\normalfont\large\bfseries\uppercase} % Format
    {} % Index
    {0em} % Separation
    {} % Before
    [{\titlerule[1pt]}] % After

\newlist{links}{enumerate*}{1}
\setlist[links]{label={}, itemjoin={\hfill}}

\newlist{categoryitems}{enumerate}{1}
\setlist[categoryitems]{label={}, leftmargin=0pt, itemjoin={}}

\newlist{categoryitemstiny}{enumerate}{1}
\setlist[categoryitemstiny]{label={}, leftmargin=0pt, itemjoin={}, nolistsep}

\newlist{descriptionitems}{enumerate}{1}
\setlist[descriptionitems]{label={\textbullet}, leftmargin=1em, itemjoin={}, nolistsep}

\newcommand{\education}[4]{
    \textbf{#1}, \textit{#2}, #3 \hfill #4
}

\newcommand{\experience}[5]{
    \textbf{#1}, \textit{#2}, #3 \hfill #4

    \vspace{-0.25em}
    
    \begin{descriptionitems}
        #5
    \end{descriptionitems}
}

\newcommand{\project}[3]{
    \textbf{#1} \hfill #2

    \vspace{-0.25em}

    \begin{descriptionitems}
        #3
    \end{descriptionitems}
}

\newcommand{\skillitem}[2]{
    \def\pleaseHelp{#2}
    \readlist*\mylist{\pleaseHelp}
    \textbf{#1:} \hspace{-0.5em}
    \foreachitem\x\in\mylist[]{\ifnum\xcnt=1\else, \fi \x}
}

\newcommand{\publication}[3]{
    \textbf{#1} \hfill Publication, #2

    \vspace{-0.25em}
    
    \begin{descriptionitems}
        #3
    \end{descriptionitems}
}

\raggedright


%% end of file `resumeow.cls'.