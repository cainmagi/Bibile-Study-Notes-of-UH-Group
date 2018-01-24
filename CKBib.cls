%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cain King's Bible Notes Template
% LaTeX Template
% -----------------------------------
% % Publications:
% -----------------------------------
% Author:
% Cain King (cainmagi@gmail.com / cain.king@foxmail.com)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{CKBib}[2017/08/29 v1.0 Bible Notes Class - Author: Yuchen Jin]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{ifthen, calc}
\SetupKeyvalOptions{family=CKBIB, prefix=CKBIB@opt@, setkeys=\kvsetkeys}

\DeclareBoolOption[false]{draft}
\DeclareBoolOption[false]{color}
\DeclareComplementaryOption{gray}{color}
\DeclareBoolOption[false]{Chinese}
\DeclareComplementaryOption{deChinese}{Chinese}
\DeclareBoolOption[false]{repeatFrameTitle}
\DeclareBoolOption[true]{autoSetHyperref}
\DeclareBoolOption[false]{refNum}
\DeclareComplementaryOption{deRefNum}{refNum}

\DeclareStringOption[\textbf{Bible Notes}:~Template]{title}[\textbf{Bible Notes}:~Template]
\DeclareStringOption[Yuchen Jin]{author}[Yuchen Jin]
\DeclareStringOption[UH Bible Study Group]{organization}[UH Bible Study Group]
\DeclareStringOption[]{version}[]

\DeclareStringOption[]{ownerPass}[]
\DeclareStringOption[]{userPass}[]

\DeclareStringOption[Romande]{mainfont}[Romande]

\newcommand{\CKBIBsetup}[1]{
  \kvsetkeys{CKBIB}{#1}
  \ifCKBIB@opt@autoSetHyperref
    \hypersetup{
      pdfauthor={\CKBIB@opt@author},% 
      pdftitle={\CKBIB@opt@title},%
      pdfsubject={Bible Study},%
      pdfstartview={Fit},%
      pdfpagelayout={TwoPageRight}
      %pdfkeywords={}%
    }
  \fi
  \ifCKBIB@opt@repeatFrameTitle
      \mdfapptodefinestyle{theoremstyle}{
          repeatframetitle=true
      }
  \fi
  \ifthenelse{\equal{\CKBIB@opt@version}{}}{
    \renewcommand{\CKBIB@str@version}{}
  }{
    \renewcommand{\CKBIB@str@version}{\CKBIB@opt@version~Edition,~}
  }
  \ifthenelse{\equal{\CKBIB@opt@ownerPass}{}}{}{
    \ifthenelse{\equal{\CKBIB@opt@userPass}{}}{
      \special{pdf:encrypt ownerpw (\CKBIB@opt@ownerPass) length 128 perm 2052}
    }{
      \special{pdf:encrypt ownerpw (\CKBIB@opt@ownerPass) userpw (\CKBIB@opt@userPass) length 128 perm 2052}
    }
  }
  \ifCKBIB@opt@refNum
    \renewcommand{\CKBIB@str@reftitle}{\section{\refname}}
  \else
    \renewcommand{\CKBIB@str@reftitle}{\vspace{2.5em} \section*{\refname}}
  \fi
}

\DeclareDefaultOption{\relax}
\ProcessKeyvalOptions*\relax

\ifthenelse{\equal{\CKBIB@opt@version}{}}{
  \newcommand{\CKBIB@str@version}{}
}{
  \newcommand{\CKBIB@str@version}{\CKBIB@opt@version~Edition,~}
}

\ifCKBIB@opt@refNum
  \newcommand{\CKBIB@str@reftitle}{\section{\refname}}
\else
  \newcommand{\CKBIB@str@reftitle}{\vspace{2.5em} \section*{\refname}}
\fi

\LoadClass[10pt,openany,final]{memoir}

%\RequirePackage{geometry}

\widowpenalty 3999
\clubpenalty 3999
\RequirePackage{pdfpages}
\RequirePackage[english]{babel}
\RequirePackage{parallel}
\newcommand{\litem}[1]{\ParallelLText{\parindent=0em {#1}}}%
\newcommand{\ritem}[1]{\ParallelRText{\parindent=0em {#1}} \ParallelPar}%

\newcommand\Loadedframemethod{TikZ}
\RequirePackage[framemethod=\Loadedframemethod]{mdframed}
\RequirePackage{tikz}
\usetikzlibrary{shadows}
\usetikzlibrary{calc,through,backgrounds}
\usetikzlibrary{matrix,positioning}
%Desssins geometriques
\usetikzlibrary{arrows}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{datavisualization}
\usetikzlibrary{automata} % LATEX and plain TEX
\usetikzlibrary{shapes.multipart}
\usetikzlibrary{decorations.pathmorphing} 

\RequirePackage{enumitem} % Customize lists %\RequirePackage{enumerate}
\setlist[enumerate]{label=(\arabic*)}
\RequirePackage{mathpazo} 

%Ecriture arabe
\RequirePackage[T1]{fontenc}
\RequirePackage{yfonts}
\RequirePackage{kerkis}
\ifthenelse{\equal{\CKBIB@opt@mainfont}{Palatino}}{
  \RequirePackage{mathpazo} % add possibly `sc` and `osf` options
  \RequirePackage{eulervm}
}{
  \ifthenelse{\equal{\CKBIB@opt@mainfont}{Times}}{
    \RequirePackage{newtxtext}
    %\RequirePackage{newtxmath}
  }{
    \ifthenelse{\equal{\CKBIB@opt@mainfont}{Stix}}{
      \RequirePackage{stix}
    }{
      \ifthenelse{\equal{\CKBIB@opt@mainfont}{Helvetica}}{
        \RequirePackage{helvet}
        \renewcommand{\rmdefault}{phv}
      }{
        \ifthenelse{\equal{\CKBIB@opt@mainfont}{Utopia}}{
          \RequirePackage[utopia]{mathdesign}
        }{
          \RequirePackage{romande}
        }
      }
    }
  }
}
%\RequirePackage{multirow,dsfont}
\RequirePackage{xcolor}
%\RequirePackage{tabularx,array}

\ifthenelse{\equal{\CKBIB@opt@ownerPass}{}}{}{
  \ifthenelse{\equal{\CKBIB@opt@userPass}{}}{
    \special{pdf:encrypt ownerpw (\CKBIB@opt@ownerPass) length 128 perm 2052}
  }{
    \special{pdf:encrypt ownerpw (\CKBIB@opt@ownerPass) userpw (\CKBIB@opt@userPass) length 128 perm 2052}
  }
}

\ifCKBIB@opt@color
  \typeout{CKBIB: Color Mode Enabled.}
  \RequirePackage[colorlinks]{hyperref}
  \definecolor{DarkGreen}{RGB}{0,128,0}
  \definecolor{CKBred}{RGB}{200,16,46}
  \definecolor{CKBgray}{RGB}{84,88,90}
  \definecolor{CKBsemiWhite}{RGB}{255,249,217}
  \definecolor{CKBwhite}{RGB}{255,255,255}
  \hypersetup{citecolor={DarkGreen}}
\else
  \typeout{CKBIB: Gray Mode Enabled.}
  \RequirePackage[hidelinks]{hyperref}
\fi

\hypersetup{pdfdisplaydoctitle={true}}

\ifpdf
  \hypersetup{pdfcreator={pdfLaTeX}}
\else
  \ifxetex
    \hypersetup{pdfcreator={xeLaTeX}}
  \else
    \hypersetup{pdfcreator={unknownLaTeX}}
  \fi
\fi

\hypersetup{
  pdfauthor={\CKBIB@opt@author},%
  pdftitle={\CKBIB@opt@title},%
  pdfsubject={Bible Study},%
  pdfstartview={Fit},%
  pdfpagelayout={TwoPageRight}}

\newcommand{\getmark}{}
\newcommand{\setmark}[1]{\renewcommand{\getmark}{#1}}
\pagestyle{ruled}
\makeoddhead{ruled}{\small\scshape \CKBIB@opt@title}{}{\small\emph{\getmark}\qquad\thepage}
\makeevenhead{ruled}{\small\thepage\qquad\emph{\getmark}}{}{\small\scshape \CKBIB@opt@title}

\tikzstyle{titregris} =
[draw=gray,fill=white, shading = exersicetitle, %
text=gray, rectangle, rounded corners, right,minimum height=.3cm]
\pgfdeclarehorizontalshading{exersicebackground}{100bp}
{color(0bp)=(green!40); color(100bp)=(black!5)}
\pgfdeclarehorizontalshading{exersicetitle}{100bp}
{color(0bp)=(red!40);color(100bp)=(black!5)}
\newcounter{exercise}
\renewcommand*\theexercise{exercice \textbf{Exercice}~n\arabic{exercise}}

\title{
    \CKBIB@opt@title
}

%================Graphic Settings====================
\RequirePackage{ifpdf, ifxetex}
\ifpdf
  \RequirePackage{graphicx}
  \RequirePackage{epstopdf}
  \graphicspath{{Pics/}}
  % and their extensions so you won't have to specify these with
  % every instance of \includegraphics
  \DeclareGraphicsExtensions{.pdf,.jpeg,.png}
\else
  \ifxetex
    \RequirePackage{graphicx}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
  \graphicspath{{Pics/}}
  % and their extensions so you won't have to specify these with
  % every instance of \includegraphics
  \DeclareGraphicsExtensions{.eps}
\fi

%%%%%%%%%

%================Frame Style Definition====================
%%%%%%%%%%%%%%%
\mdfdefinestyle{theoremstyle}{%
    outerlinewidth=0.01em,linecolor=black,middlelinewidth=0.5pt,%
    %leftmargin = \parindent,%
    frametitlerule=true,roundcorner=2pt,%
    apptotikzsetting={\tikzset{mfframetitlebackground/.append style={%
                shade,left color=white, right color=blue!20}}},
    frametitlerulecolor=black,innertopmargin=1\baselineskip,%green!60,
    innerbottommargin=0.5\baselineskip,
    frametitlerulewidth=0.1pt,
    innertopmargin=0.7\topskip,skipabove={\dimexpr0.2\baselineskip+0.1\topskip\relax},
    frametitleaboveskip=1pt,
    frametitlebelowskip=1pt,
    everyline=true
}

\global\mdfdefinestyle{coloredsec}{%
    outerlinewidth=0.01em,linecolor=black,middlelinewidth=0.5pt,%
    roundcorner=2pt,%
    innerbottommargin=0.5\baselineskip,
    innertopmargin=0.7\topskip,
    skipabove=0pt, skipbelow=0pt
}

\definecolor{gray}{gray}{0.77}
\definecolor{black}{gray}{0}
\setlength\beforechapskip{0pt}
\setlength\midchapskip{5pt}
\setlength\afterchapskip{30pt}
\makechapterstyle{plroman}{
\renewcommand\chapternamenum{}
\renewcommand\printchaptername{}
\renewcommand\printchapternum{\color{gray}\centering\MakeUppercase{\fontsize{1in}{2in}\selectfont\romannumeral\thechapter}}
\renewcommand\chapnumfont{\HUGE\rmfamily\centering\romannumeral}
\renewcommand\chaptitlefont{\Huge\centering\color{black}\vskip\midchapskip\vskip\midchapskip}
\renewcommand\afterchapternum{%
\par\nobreak\vskip\midchapskip\vskip\midchapskip}
\renewcommand\printchapternonum{%
\vphantom{\chapnumfont \thechapter}
\par\nobreak\vskip\midchapskip\hrule\vskip\midchapskip}
}
\chapterstyle{plroman}

%%% customizing of table of contents

\renewcommand{\cftchapterfont}{\scshape\mdseries}

\renewcommand{\cftchapterleader}{\dotfill}

\renewcommand{\cftchapterpagefont}{\scshape\mdseries}

\renewcommand{\chapternumberline}[1]{\hspace*{-5em}\vbox{\hfil\hsize=7.5em\MakeUppercase{\mdseries\romannumeral#1}.\ \hfilneg}}

\renewcommand{\cftchapterbreak}{\vspace*{-0.93em}}

\ifCKBIB@opt@color
    \mdfapptodefinestyle{theoremstyle}{
      frametitlebackgroundcolor=CKBred,
      frametitlefont=\normalfont\bfseries\color{CKBsemiWhite},
      frametitlerulecolor=CKBred,
      linecolor=CKBred, backgroundcolor=CKBwhite,
      shadow=true, shadowsize=5pt
    }
    \global\mdfdefinestyle{coloredtitle}{%
      linecolor=CKBred, middlelinewidth=3pt,%
      backgroundcolor = CKBred,
      shadow=true, shadowsize=6pt
    }
    \mdfapptodefinestyle{coloredsec}{
      linecolor=CKBgray, middlelinewidth=3pt,%
      backgroundcolor = CKBgray,
      shadow=true, shadowsize=6pt
    }
\fi

\ifCKBIB@opt@repeatFrameTitle
  \mdfapptodefinestyle{theoremstyle}{
    repeatframetitle=true
  }
\fi

%================Theorem definition====================
\mdtheorem[style=theoremstyle]{definition}{\textbf{Exercice}}
\providecommand*{\definitionautorefname}{Exercise}

\RequirePackage{titletoc}
%================LanguageSettings====================
\ifCKBIB@opt@Chinese
  \RequirePackage[PunctStyle=kaiming,AutoFakeBold,AutoFakeSlant]{xeCJK}
  \setCJKmainfont[BoldFont={Source Han Serif SC SemiBold}, ItalicFont={STKaiti}]{Source Han Serif SC}
  \setCJKmonofont[BoldFont={Source Han Serif SC SemiBold}, ItalicFont={STKaiti}]{Source Han Serif SC Medium} %思源常体
  \newCJKfontfamily[syseribol]\ExtBoldF[BoldFont={Source Han Serif SC Heavy}, ItalicFont={STKaiti}]{Source Han Serif SC Bold} %思源粗宋
  \newCJKfontfamily[syseriexl]\LightF[BoldFont={Source Han Serif SC Light}, ItalicFont={STKaiti}]{Source Han Serif SC ExtraLight} %思源特细宋
  \newCJKfontfamily[sysansbol]\ExtBoldSansF[BoldFont={Source Han Sans SC Heavy}, ItalicFont={STKaiti}]{Source Han Sans SC Bold} %思源粗黑
  \newCJKfontfamily[sysansreg]\SansF[BoldFont={Source Han Sans SC Medium}, ItalicFont={Source Han Sans SC Regular}]{Source Han Sans SC Regular} %思源常黑
  \newCJKfontfamily[sysansexl]\LightSansF[BoldFont={Source Han Sans SC Light}, ItalicFont={STKaiti}]{Source Han Sans SC ExtraLight} %思源特细黑
  \setCJKsansfont[BoldFont={Source Han Sans SC Medium}, ItalicFont={STKaiti}]{Source Han Sans SC Regular}% 设置缺省中文字体
  \setCJKfallbackfamilyfont{\CJKrmdefault}{SimSun-ExtB}
  \setCJKfallbackfamilyfont{\CJKsfdefault}{PMingLiU}
  \renewcommand\contentsname{目~~录}
  \renewcommand\listfigurename{插~图~目~录} % 对List of Figures进行汉化为插图目录
  \renewcommand\listtablename{表~格~目~录}  % 对List of Tables进行汉化表格目录
  %\newenvironment{proof}[1][证明]{\textbf{#1:~~~}}{\hfill\hspace{\qquad}$\square$}
  \addto\extrasenglish{%
    \def\chapterautorefname{章}
    \def\sectionautorefname{节}
    \def\subsectionautorefname{节}
    \renewcommand{\figurename}{图}
    \renewcommand{\tablename}{表}
    \renewcommand{\figureautorefname}{图}
    \renewcommand{\tableautorefname}{表}
  }
  \newcommand{\chapFont}{\ExtBoldSansF}
  \newcommand{\secFont}{\SansF\bfseries}
\else
  \newcommand{\chapFont}{\sffamily\bfseries}
  \newcommand{\secFont}{\sffamily\bfseries}
\fi

%===============Shade Quote Settings===================
\RequirePackage{framed}
\definecolor{mygray}{gray}{.9}

\newfontfamily\quotefont[Ligatures=TeX]{Linux Libertine O} % selects Libertine as the quote font  
%\newcommand{\quotefont}{}
\newcommand*\quotesize{60} % if quote size changes, need a way to make shifts relative
% Make commands for the quotes
\newcommand*{\openquote}
   {\tikz[remember picture,overlay,xshift=-4ex,yshift=-2.5ex]
   \node (OQ) {\quotefont\fontsize{\quotesize}{\quotesize}\selectfont``};\kern0pt}

\newcommand*{\closequote}[1]
  {\tikz[remember picture,overlay,xshift=4ex,yshift={#1}]
   \node (CQ) {\quotefont\fontsize{\quotesize}{\quotesize}\selectfont''};}

% select a colour for the shading
\colorlet{shadecolor}{mygray}

\newcommand*\shadedauthorformat{\emph} % define format for the author argument

% Now a command to allow left, right and centre alignment of the author
\newcommand*\authoralign[1]{%
  \if#1l
    \def\authorfill{}\def\quotefill{\hfill}
  \else
    \if#1r
      \def\authorfill{\hfill}\def\quotefill{}
    \else
      \if#1c
        \gdef\authorfill{\hfill}\def\quotefill{\hfill}
      \else\typeout{Invalid option}
      \fi
    \fi
  \fi}
% wrap everything in its own environment which takes one argument (author) and one optional argument
% specifying the alignment [l, r or c]
%
\newenvironment{shadequote}[2][l]%
{\authoralign{#1}
\ifblank{#2}
   {\def\shadequoteauthor{}\def\yshift{-2ex}\def\quotefill{\hfill}}
   {\def\shadequoteauthor{\par\authorfill\shadedauthorformat{#2}}\def\yshift{2ex}}
\begin{snugshade}\begin{quote}\openquote}
{\shadequoteauthor\quotefill\closequote{\yshift}\end{quote}\end{snugshade}\normalfont\selectfont}

\RequirePackage[paperwidth=3.54in,paperheight=4.72in,hmargin={0.17in,0.17in},vmargin={0.50in,0.17in}]{geometry}

\newcommand{\includechapter}[1]{\include{#1} \cleardoublepage}
\newcommand{\BibSentence}[4]{\begin{shadequote}[r]{\textbf{\SansF{#1~#2:#3}}}\normalfont #4\end{shadequote}}
\newcommand{\BibT}[2]{\SansF{#1~#2:}\normalfont\selectfont}
\newcommand{\BibS}[2]{${}^{\textrm{\footnotesize #1}}$#2}
\ifCKBIB@opt@Chinese
  \newcommand{\Lord}{　神}
\else
  \newcommand{\Lord}{Lord}
\fi

\linespread{1.2}
\setlength{\parskip}{0ex}
\setlength{\parsep}{0ex} 
\setlength{\itemsep}{0ex}
\setlength{\parindent}{2em}

\usepackage[sectionbib,sort&compress,numbers]{natbib}
\RequirePackage[sectionbib]{chapterbib}
%\RequirePackage{multibib}
%\ifCKBIB@opt@Chinese
%  \newcites{cptone}{本章参考}
%\else
%  \newcites{cptone}{Reference}
%\fi
  
% Removes the header from odd empty pages at the end of chapters
\makeatletter
\renewcommand{\cleardoublepage}{
\clearpage\ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\thispagestyle{empty}
\newpage
\fi}
\makeatother