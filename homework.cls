% Based on https://github.com/jdavis/latex-homework-template/blob/master/homework.tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2022/02/05 Homework Template]

\RequirePackage{fancyhdr}
\RequirePackage{extramarks}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{tikz}
\RequirePackage[plain]{algorithm}
\RequirePackage{algpseudocode}

\usetikzlibrary{automata,positioning}

% Our homework class is based on article, all unknown options will be passed to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Class Name
\newcommand\className[1]{\renewcommand\@className{#1}}
\newcommand\@className{\@latex@error{No \noexpand\className given}\@ehc}

% Class Instructor
\newcommand\classInstructor[1]{\renewcommand\@classInstructor{#1}}
\newcommand\@classInstructor{\@latex@error{No \noexpand\classInstructor given}\@ehc}

% Class Time
\newcommand\classTime[1]{\renewcommand\@classTime{#1}}
\newcommand\@classTime{\@latex@error{No \noexpand\classTime given}\@ehc}

% University
\newcommand\university[1]{\renewcommand\@university{#1}}
\newcommand\@university{\@latex@error{No \noexpand\university given}\@ehc}

% Due Date
\newcommand\dueDate[1]{\renewcommand\@dueDate{#1}}
\newcommand\@dueDate{\@latex@error{No \noexpand\dueDate given}\@ehc}

% Some basic settings
\topmargin=-0.45in
\evensidemargin=0in
\oddsidemargin=0in
\textwidth=6.5in
\textheight=9.0in
\headsep=0.25in

\linespread{1.1}

\pagestyle{fancy}
\lhead{\@author}
\chead{\@className\ (\@classInstructor\ \@classTime): \title}
\rhead{\firstxmark}
\lfoot{\lastxmark}
\cfoot{\thepage}

\renewcommand\headrulewidth{0.4pt}
\renewcommand\footrulewidth{0.4pt}

\setlength\parindent{0pt}

\newcommand{\enterProblemHeader}[1]{
    \nobreak\extramarks{}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
}

\newcommand{\exitProblemHeader}[1]{
    \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    \stepcounter{#1}
    \nobreak\extramarks{Problem \arabic{#1}}{}\nobreak{}
}

\setcounter{secnumdepth}{0}
\newcounter{partCounter}
\newcounter{homeworkProblemCounter}
\setcounter{homeworkProblemCounter}{1}
\nobreak\extramarks{Problem \arabic{homeworkProblemCounter}}{}\nobreak{}

\newenvironment{problem}[1][-1]{
    \ifnum#1>0
        \setcounter{homeworkProblemCounter}{#1}
    \fi
    \section{Problem \arabic{homeworkProblemCounter}}
    \setcounter{partCounter}{1}
    \enterProblemHeader{homeworkProblemCounter}
}{
    \exitProblemHeader{homeworkProblemCounter}
}

\renewcommand{\maketitle}{
    \begin{titlepage}
        \begin{center}
            \vspace{2in}
            \Large
            \textmd{\textbf{\@className: \@title}}

            \normalsize
            \vspace{0.1in}
            \small{Due on \@dueDate}

            \vspace{0.1in}
            \large
            \textit{\@classInstructor\ \@classTime}

            \vfill
            \Large
            \@author

            \@university

        \end{center}
    \end{titlepage}
}
