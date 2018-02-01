%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cain King's Bible Notes Template
% LaTeX Template
% -----------------------------------
% % Update statements:
% -----------------------------------
% % Version 1.2 (1/28/18)
%     - Revise the format of contents.
%     - Add env. for control the appendices of a part.
% % Version 1.0 (1/26/18)
%     - Create and revise the template.
% -----------------------------------
% % Control options statements:
% -----------------------------------
% % ----------------------
% % Text Configuration
%  (It is highly recommended to master them. Use \CKBIBsetup{} to
%   change them)
% %
%  title            : [string], the title of pdf metadata, also shown in head.
%  author           : [string], the author of pdf metadata.
%  ownerPass        : [string], password, if not provided, users could not edit
%                     this document.
%  userPass         : [string], password, if not provided, users could not open
%                     this document.
%                       - Noted that if ownerPass is not defined, this password 
%                         will not be effective!
%  repeatFrameTitle : [bool], let all frame which are divided by pagebreak remake
%                     their titles.
% % ----------------------
% % Basic Configuration
%  (Options influencing the style. Use them as \documentclass[...]{CKBIB}
%     because \CKBIBsetup will not work.)
%  (Noted that [] shows the default option.)
% %
%  color :   [false], make links, section titles and frames colored.
%  mainfont: [Romande], use different types of fontfamily. Here are avaliable options:
%              - Romande,  - Palatino,  - Times,  - Stix,  - Helvetica,  - Utopia.
%  inDay/inNight: [inDay=true], the mode of the output. inDay is the normal mode, while
%                               using inNight could turns the output dark.
%  draft: [false], a convenient setting for users to write draft, because all figures
%         would be disabled.
% % ----------------------
% % Command & Environment
%  (C marks a command and E marks an environment.)
% %
% % \maketitle {C}
%   - Used to make a modified title.
% % \CKBIBsetup {C}
%   - Basic setup command of the control options.
% % Some commands for emphasizing texts:
%   - \Tbib {C}: used to emphasize the words of LORD.
%   - \Tafter {C}: used to emphasize what we add after the fellowship on the next 
%                  Thursday.
%   - \Tadd {C}: used to emphasize what we add for other reasons (commonly for futher
%                modification.)
% % Some commands for refer the context of LORD's words:
%   - \BibSentence{Tit}{NumC}{NumS}{Context}: {C} used to refer a complete block.
%     Tit is the name of the book; NumC is the number of chapter; NumS is the number 
%     of the section; Context is as the name.
%     This reference would be formed as a gray block which contains LORD's word. 
%   - \BibT{Tit}{Num}: {C} used to refer the marks of sentences of Bible.
%                      Tit is the title of the book; Num is the number of those 
%                      sentences.
%   - \BibS{Num}{Context}: {C} used to refer one specific sentence of Bible.
%                      Num is the number of the section; Context is used as the name. 
% % \begin{paracol}{2} ... \end{paracol} {E}
%   - Environment for parallel type-out. Here are some commands should only be used 
%     in this environment.
%     -|- \litem {C}: the left side of one block. Must be followed by \ritem and 
%                     should not follow another \litem.
%     -|- \ritem {C}: the right side of one block. Must follow \litem.
% % \begin{appendices} ... \end{appendices} {E}
%   - Environment of appendices. This env. enable users to append more than one 
%     appendices to the same part. (May need to pay attention to \setmark when using
%     this env..)
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
\RequirePackage{xstring}
\RequirePackage{ifthen, calc}
\SetupKeyvalOptions{family=CKBIB, prefix=CKBIB@opt@, setkeys=\kvsetkeys}

\DeclareBoolOption[false]{draft}
\DeclareBoolOption[false]{color}
\DeclareComplementaryOption{gray}{color}
\DeclareBoolOption[false]{inNight}
\DeclareComplementaryOption{inDay}{inNight}
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
\DeclareStringOption[0]{singchap}[0]

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
      pdfstartview={Fit}%
      %pdfkeywords={}%
    }
    \ifthenelse{\equal{\CKBIB@opt@singchap}{0}}{
      \hypersetup{pdfpagelayout={TwoPageRight}}
    }{
      \hypersetup{pdfpagelayout={TwoPageLeft}}
      \setcounter{chapter}{\CKBIB@opt@singchap-1}
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

\ifCKBIB@opt@draft
  \LoadClass[10pt,openany,draft]{memoir}
\else
  \LoadClass[10pt,openany,final]{memoir}
\fi

\widowpenalty 3999
\clubpenalty 3999
\RequirePackage{pdfpages}
\RequirePackage[english]{babel}
\RequirePackage{paracol}
\newcommand{\litem}[1]{\begin{column*}\parindent=0em #1\end{column*}}
\newcommand{\ritem}[1]{\begin{column}\parindent=0em #1\end{column}}

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
\setlist[enumerate]{label=(\arabic*),itemsep=0.1\itemsep,parsep=0ex}
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
\RequirePackage{marvosym}
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

\hypersetup{pdfdisplaydoctitle={true},breaklinks={true}}

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
  pdfstartview={Fit}}
  
\ifthenelse{\equal{\CKBIB@opt@singchap}{0}}{
  \hypersetup{pdfpagelayout={TwoPageRight}}
}{
  \hypersetup{pdfpagelayout={TwoPageLeft}}
  \setcounter{chapter}{\CKBIB@opt@singchap-1}
}

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
  \newcommand{\smallTitle}[1]{\ExtBoldF{#1}\normalfont\selectfont}
\else
  \newcommand{\chapFont}{\sffamily\bfseries}
  \newcommand{\secFont}{\sffamily\bfseries}
  \newcommand{\smallTitle}[1]{\textbold{#1}}
\fi

\newcommand{\getmark}{}
\newcommand{\setmark}[1]{\protect\renewcommand{\getmark}{#1}}
\pagestyle{ruled}
\makeoddhead{ruled}{\small\scshape\bfseries\CKBIB@opt@title}{}{\small\emph{\getmark}\qquad\thepage}
\makeevenhead{ruled}{\small\thepage\qquad\emph{\getmark}}{}{\small\scshape\bfseries\CKBIB@opt@title}

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

\ifCKBIB@opt@inNight
  \definecolor{pageBGColor}{gray}{0.1}
  \definecolor{TBibleColor}{RGB}{255,255,191}
  \definecolor{TNormalColor}{RGB}{255,255,255}
  \definecolor{TAfterColor}{RGB}{191,191,255}
  \definecolor{TAdditionColor}{RGB}{255,191,191}
  \pagecolor{pageBGColor}
  \definecolor{graphgray}{gray}{.9}
  \definecolor{mygray}{gray}{.2}
  \definecolor{chapgray}{gray}{0.33}
  \definecolor{chapblack}{gray}{1}
\else
  \definecolor{TNormalColor}{RGB}{0,0,0}
  \definecolor{TAfterColor}{RGB}{0,0,64}
  \definecolor{TAdditionColor}{RGB}{64,0,0}
  \definecolor{TBibleColor}{RGB}{64,64,0}
  \definecolor{mygray}{gray}{.9}
  \definecolor{chapgray}{gray}{0.77}
  \definecolor{chapblack}{gray}{0}
\fi

\newcommand{\Tafter}[1]{\textcolor{TAfterColor}{#1}}
\newcommand{\Tadd}[1]{\textcolor{TAdditionColor}{#1}}
\newcommand{\Tbib}[1]{\textcolor{TBibleColor}{#1}}

\def\includeCKBgraph{\futurelet\next\includeCKBgraphAux}
\def\includeCKBgraphAux{
  \ifx\next[%
    \expandafter\includeCKBgraphOptArg
  \else
    \expandafter\includeCKBgraphArg
  \fi
}

\ifCKBIB@opt@inNight
  \newcommand{\includegraphprotected}[2]{\colorbox{graphgray}{\includegraphics[#1]{#2}}}
\else
  \newcommand{\includegraphprotected}[2]{\includegraphics[#1]{#2}}
\fi

\ifCKBIB@opt@draft
  \def\includeCKBgraphOptArg[#1]#2{\relax
    \includegraphprotected{#1,draft}{#2}
  }
  \def\includeCKBgraphArg#1{\relax
    \includegraphprotected{width=0.8\columnwidth,draft}{#1}
  }
\else
  \def\includeCKBgraphOptArg[#1]#2{\relax
    \includegraphprotected{#1}{#2}
  }
  \def\includeCKBgraphArg#1{\relax
    \includegraphprotected{width=0.8\columnwidth}{#1}
  }
\fi

\setlength\beforechapskip{0pt}
\setlength\midchapskip{5pt}
\setlength\afterchapskip{30pt}

\newcommand{\chapnumcase}[1]{\IfInteger{#1}{\MakeUppercase{\mdseries\romannumeral#1}}{#1}}
\newcommand{\chapnumcaseplain}[1]{\IfInteger{#1}{\romannumeral#1}{#1}}
\makechapterstyle{plroman}{
  \renewcommand\chapternamenum{}
  \renewcommand\printchaptername{}
  \renewcommand\chapnumfont{\HUGE\rmfamily\centering}
  \ifCKBIB@opt@Chinese
    \renewcommand\chaptitlefont{\Huge\chapFont\centering\color{chapblack}\vskip\midchapskip\vskip\midchapskip}
  \else
    \renewcommand\chaptitlefont{\Huge\centering\color{chapblack}\vskip\midchapskip\vskip\midchapskip}
  \fi
  \renewcommand\afterchapternum{%
  \par\nobreak\vskip\midchapskip\vskip\midchapskip}
  \renewcommand\printchapternum{\color{chapgray}\centering{\fontsize{1in}{2in}\selectfont\protect\chapnumcase{\thechapter}}}
  \renewcommand\printchapternonum{%
  \vphantom{\chapnumfont\protect\chapnumcaseplain{\thechapter}}
  \par\nobreak\vskip\midchapskip\hrule\vskip\midchapskip}
  
}
\chapterstyle{plroman}
\renewcommand{\chapternumberline}[1]{\hspace*{-5em}\vbox{\hfil\protect\hsize=7.5em\protect\chapnumcase{#1}.\ \hfilneg}}
%%% customizing of table of contents

\renewcommand{\cftchapterfont}{\scshape\mdseries}

\renewcommand{\cftchapterleader}{\dotfill}

\renewcommand{\cftchapterpagefont}{\scshape\mdseries}

\newcommand{\addtocchapterspace}{\hspace{2.5em}}

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

%===============Shade Quote Settings===================
\RequirePackage{framed}

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
\newcommand{\BibT}[3][:]{\textcolor{TBibleColor}{\SansF{#2~#3#1}\normalfont\selectfont}}
\newcommand{\BibS}[2]{\textcolor{TBibleColor}{${}^{\textrm{\footnotesize #1}}$#2}}
\ifCKBIB@opt@Chinese
  \newcommand{\Lord}{　神}
\else
  \newcommand{\Lord}{Lord}
\fi

\linespread{1.2}
\setlength{\parskip}{0ex}
\setlength{\parindent}{2em}

\RequirePackage[sectionbib,sort&compress,numbers]{natbib}
\RequirePackage[sectionbib]{chapterbib}
%\RequirePackage{multibib}
%\ifCKBIB@opt@Chinese
%  \newcites{cptone}{本章参考}
%\else
%  \newcites{cptone}{Reference}
%\fi

\RequirePackage{xltxtra}

\makeatletter
\newcommand{\globalcolor}[1]{%
  \color{#1}\global\let\default@color\current@color
}

\AtBeginDocument{\globalcolor{TNormalColor}}

\RequirePackage{appendix}

\makeatletter
% Removes the header from odd empty pages at the end of chapters
\renewcommand{\cleardoublepage}{
\clearpage\ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\thispagestyle{empty}
\newpage
\fi}
\makeatother