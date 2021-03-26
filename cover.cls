\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cover}[2021/03/25]
\LoadClass{article}


% \typeout{ Template for Cover Letter }
\RequirePackage[right=3cm,left=3cm,top=2cm,bottom=1cm]{geometry}
\RequirePackage{ragged2e}
\RequirePackage{xifthen}

\RequirePackage{fontspec}
\setmainfont{TeX Gyre Heros}

\renewcommand{\baselinestretch}{1.15}
\pagenumbering{gobble}


\long\def\comment#1{}
\comment{
  Example of use:
  \documentclass[12pt]{cover}

  % MY INFO ==========
  \myname{John Smith}
  \myaddress{City, State 12345}
  \myphone{(000) 111-1111}
  \myemail{john.smith@example.com}

  \datewritten{\today}

  % RECRUITER INFO ==========
  \suffix{Mrs} % \suffix can be optionally empty like \suffix{}.
  \firstname{Jane}
  \lastname{Smith}
  \jobtitle{Recruiter Officer}
  \companyname{The Corporation}
  \addressOne{123 Plesaant Lane}
  \addressTwo{City, State 12345}

  % PARAGRAPHS + CLOSING ==========
  \paragraphOne{Reason for the letter.}
  \paragraphTwo{Why you are interested in the position.}
  \paragraphThree{Request a personal interview.}
  \closing{Sincerely yours}

  \begin{document}
    \dothething
  \end{document}
}


% MY INFO ==========
\def\myname#1{\gdef\@myname{#1}}
\def\myaddress#1{\gdef\@myaddress{#1}}
\def\myphone#1{\gdef\@myphone{#1}}
\def\myemail#1{\gdef\@myemail{#1}}

% DATE WRITTEN ==========
\def\datewritten#1{\gdef\@datewritten{#1}}

% % RECRUITER INFO ==========
\def\suffix#1{
  \ifthenelse{\isempty{#1}}%
    { \gdef\@suffix{}     }% if #1 is empty
    { \gdef\@suffix{#1. } }% if #1 is not empty
}
\def\firstname#1{\gdef\@firstname{#1}}
\def\lastname#1{\gdef\@lastname{#1}}
\def\jobtitle#1{\gdef\@jobtitle{#1}}
\def\companyname#1{\gdef\@companyname{#1}}
\def\addressOne#1{\gdef\@addressOne{#1}}
\def\addressTwo#1{\gdef\@addressTwo{#1}}

% % PARAGRAPHS + CLOSING ==========
\def\parOne#1{\gdef\@parOne{#1}}
\def\parTwo#1{\gdef\@parTwo{#1}}
\def\parThree#1{\gdef\@parThree{#1}}
\def\closing#1{\gdef\@closing{#1}}


\def\makemyinfo{
  \begin{center}
    \textbf{
      {\large{ \@myname }}\\
      \@myaddress\\
      \@myphone\\
      \@myemail\\
    }
  \end{center}
}

\def\makerecinfo{
  \begin{flushleft}
    \@suffix \@firstname \ \@lastname\\
    \@jobtitle\\
    \@companyname\\
    \@addressOne\\
    \@addressTwo\\
  \end{flushleft}
}


\def\makeletter{
  \begin{flushleft}
    \justify
    Dear \@suffix \@lastname, \vspace{10pt}\\
    \@parOne \vspace{10pt}\\
    \@parTwo \vspace{10pt}\\
    \@parThree \vspace{16pt}\\
    \@closing, \vspace{42pt}\\
    \@myname
  \end{flushleft}
}

\def\dothething{
  \makemyinfo
  \vspace{42pt}
  \@datewritten
  \vspace{10pt}
  \makerecinfo
  \vspace{10pt}
  \makeletter
}
