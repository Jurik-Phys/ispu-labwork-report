\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ispu-labwork-report}[28/04/2025 version 0.02]

%%%%%%% Load and setup necessary packages %%%%%%%
\LoadClass[12pt,a4paper]{extarticle}
\RequirePackage{amssymb,amsmath}             %% AMS-LaTeX
\RequirePackage{bm}                          %% Bold math symbols
\RequirePackage{ifxetex}                     %% Для сборки документа и pdflatex'ом, и xelatex'ом
%\RequirePackage{textcomp}                   %% Типографские значки (русское тире вместо ---)

\ifxetex
   %% xelatex
    \RequirePackage{polyglossia}                   %% загружает пакет многоязыковой вёрстки
    \setdefaultlanguage[spelling=modern]{russian}  %% устанавливает главный язык документа
    \setkeys{russian}{babelshorthands=true}        %% позволяет использовать тире из babel
    \setotherlanguage{english}                     %% объявляет второй язык документа
    \defaultfontfeatures{Ligatures={TeX}}          %% свойства шрифтов по умолчанию

    % =>> Set Microsoft default fonts
    \setmainfont[Ligatures={TeX}]{Times New Roman} %% задаёт основной шрифт документа
    \newfontfamily{\cyrillicfont}{Times New Roman}          %% workaround for polyglosia

    \setsansfont{Arial}                                     %% задаёт шрифт без засечек
    \newfontfamily{\cyrillicfontsf}{Arial}

    \setmonofont{Courier New}                               %% моноширинный шрифт
    \newfontfamily{\cyrillicfonttt}{Courier New}

    % =>> Set LaTeX default fonts
    % \setmainfont[Ligatures={TeX}]{CMU Serif}       %% задаёт основной шрифт документа
    % \setsansfont{CMU Sans Serif}                   %% задаёт шрифт без засечек
    % \setmonofont{CMU Typewriter Text}              %% задаёт моноширинный шрифт
\else
    %% pdflatex
    \RequirePackage{cmap}                     %% Поиск русских слов в pdf
    \RequirePackage[T2A]{fontenc}             %% Внутренняя кодировка шрифта
    \RequirePackage[utf8]{inputenc}           %% Кодировка исходного текста
    \RequirePackage[english,russian]{babel}   %% Поддержка русского текста
\fi

\RequirePackage{indentfirst}                  %% Сделать отступ в первом абзаце
\setlength\parindent{0.6cm}
\RequirePackage{float}                        %% "Обход" ограничения на кол-во плавающих объектов
\RequirePackage{wrapfig}                      %% Обтекание картинки текстом
\RequirePackage{pbox}                         %% Для простой реализации двойных строк в ячейках таблицы
\RequirePackage{array}                        %% Дополнительные модификаторы для окружения tabular
\RequirePackage{multirow}                     %% Объединение нескольких строк в одну, в таблицах
\RequirePackage{ifthen}                       %% Обработка условий в документе
\RequirePackage{longtable}                    %% Длинные таблицы
\RequirePackage[left=2cm,   %
            right=2cm,  %
            top=2cm,    %
            bottom=2.5cm, %
            bindingoffset=0cm]{geometry}
\RequirePackage{graphicx}                     %% Расширенная поддержка графики
    \graphicspath{{./fig/}}

\RequirePackage{listings}                     %% Подсветка кода
\RequirePackage{xcolor}                       %% Поддержка именованных цветов

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{%
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}

\lstset{style=mystyle}

\RequirePackage{setspace}                     %% Настройка межстрочного интервала
    \singlespacing
    %% \onehalfspacing
    %% \doublespacing
    %% \setstretch{множитель}

\RequirePackage[labelsep=period]{caption}     %% Настройка caption у плавающих объектов
\captionsetup[figure]{%
    textfont={footnotesize,normalfont},       %% Шрифт подписи
    labelfont={footnotesize, normalfont}      %% Шрифт метки "Рис. N"
}

\captionsetup[table]{%
    labelfont={normalfont,footnotesize},      %% Не жирный шрифт для метки "Таблица N"
    textfont={bf,footnotesize},               %% Шрифт текста подписи таблицы
    justification=raggedright,                %% Выравнивание по левому краю
    singlelinecheck=false,                    %% Отключение центрирования коротких подписей
    margin=0.25em,                            %% Горизонтальный отступ надписи "Таблица N"
    skip=0.3em,                               %% Вертикальный отступ после подписи
}

\RequirePackage{enumitem}                     %% Контроль вертикального расстояния в и между списками
    \setenumerate{nosep}                      %% Убрать дополнительные вертикальные отсупы для enumerate
    \setitemize{nosep}                        %% - / - / - / - / - / - / - / - / - / - / - / - itemize
    \setdescription{nosep}                    %% - / - / - / - / - / - / - / - / - / - / - / - description

\RequirePackage{csquotes}                     %% Обработка "русских" кавычек.
                                              %% Рекомендуется при использовании biblatex.

\RequirePackage[unicode=true,pdfborder={0}]{hyperref} %% Гиперссылки в pdf документе

\RequirePackage{rotating}                     %% Вращение рисунков и таблиц вместе с подписью
% \begin{sidewaystable}   \end{sidewaystable}
% \begin{sidewaysfigure}  \end{sidewaysfigure}

\setcounter{secnumdepth}{0}                   %% Удалить номера у секций

\RequirePackage{tocloft}                               %% Настройка оглавления

\cftsetindents{section}{1.20em}{0.0em}                 %% Горизонтальный отступ в содержании
\setlength{\cftbeforesecskip}{0.35em}                  %% Настройка вертикального расстояния между разделами в оглавлении
\renewcommand{\cftsecaftersnum}{.}                     %% Добавить точку после номера раздела
\renewcommand{\cftsubsecaftersnum}{.}                  %% - / - / - / - / - / - / - / подраздела
\renewcommand\cftsecpagefont{\normalfont}              %% Шрифт номеров страниц в оглавлении
\renewcommand\cftsecfont{\normalfont}                  %% Шрифт названия раздела в оглавлении
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}  %% Добавить точки к секциям в оглавлении

\addtocontents{toc}{\protect\setcounter{tocdepth}{1}}  %% Сокращение глубины оглавленияю



%%%%%%% Users commands %%%%%%%
\newcommand{\drawline}[1][\textwidth]%        %% Линия регулируемой длинны
    {\noindent\makebox[\linewidth]{\rule{#1}{0.4pt}}}

\RequirePackage{xparse}                                %% Два и более студента, динамическое число аргументов
\NewDocumentCommand{\students}{m m g g g g g g}{%
    \def\@stdsgroup{#1}
    \def\@studnamea{#2}
    \IfNoValueTF{#3}{\def\@studnameb{}}{\def\@studnameb{#3}}
    \IfNoValueTF{#4}{\def\@studnamec{}}{\def\@studnamec{#4}}
    \IfNoValueTF{#5}{\def\@studnamed{}}{\def\@studnamed{#5}}
    \IfNoValueTF{#6}{\def\@studnamee{}}{\def\@studnamee{#6}}
    \IfNoValueTF{#7}{\def\@studnamef{}}{\def\@studnamef{#7}}
    \IfNoValueTF{#8}{\def\@studnameg{}}{\def\@studnameg{#8}}
}

% Преподаватель
\newcommand{\teacher}[2]{\def\@teacherid{#1}\def\@teachername{#2}}
\teacher{}

% Название лабораторной работы
\newcommand{\labtitle}[2]{\def\@labid{#1}\def\@labtitle{#2}}

% Министерство
\newcommand{\ministry}[1]{\def\@ministry{#1}}

% Организация
\newcommand{\organization}[1]{\def\@organization{#1}}

% Кафедра
\newcommand{\department}[1]{\def\@department{#1}}

% Город
\newcommand{\city}[1]{\def\@city{#1}}

% Дата
\renewcommand{\date}[1]{\def\@date{#1}}

% Печатать титульную страницу
\renewcommand{\maketitle}{%
    % no page number
    \pagestyle{empty}

    \ifthenelse{\equal{\@ministry}{}}%
       {}%
       {
           \begin{center}
                \large{\@ministry}
           \end{center}
       }

    \ifthenelse{\equal{\@organization}{}}%
       {}%
       {
           \begin{center}
                \large{\@organization}
           \end{center}
       }

    \ifthenelse{\equal{\@department}{}}%
       {}%
       {
           \vspace{0.5em}
           \begin{center}
                \large{\@department}
           \end{center}
       }

    \ifthenelse{\equal{\@labtitle}{}}%
       {}%
       {
           \vspace{10em}
           \begin{center}
                \large{\@labid} \\
                \Large{\textbf{\@labtitle}}
           \end{center}
       }

    \vspace{6em}
    \begin{flushright}
        \begin{minipage}[t]{0.73\textwidth}
            \begin{table}[H]
                \begin{tabular}{r p{3cm} l}
                    \ifthenelse{\equal{\@studnameb}{}}%
                    {% Один студент
                        \large{Выполнил студент} \\ \large{группы \@stdsgroup} & \rule{30mm}{0.4pt} & \large{\@studnamea} \\
                    }
                    {% Не один студент
                        \large{Выполнили студенты} \\ \large{группы \@stdsgroup} & \rule{30mm}{0.4pt} & \large{\@studnamea} \\
                    }
                    \ifthenelse{\equal{\@studnameb}{}}%
                    {% Один
                        \ifthenelse{\equal{\@teachername}{}}%
                        {}%
                        {
                            \rule{0pt}{2em}\large{Проверил} \\ \large{\@teacherid} & \rule{30mm}{0.4pt} & \large{\@teachername} \\
                        }
                        \vspace{7.8em}
                    }%
                    {
                        \rule{0pt}{1.3em}                                      & \rule{30mm}{0.4pt} & \large{\@studnameb} \\
                        \ifthenelse{\equal{\@studnamec}{}}%
                        {% Два
                            \ifthenelse{\equal{\@teachername}{}}%
                            {}%
                            {
                                \rule{0pt}{2em}\large{Проверил} \\ \large{\@teacherid} & \rule{30mm}{0.4pt} & \large{\@teachername} \\
                            }
                            \vspace{6.5em}
                        }%
                        {
                            \rule{0pt}{1.3em}                                      & \rule{30mm}{0.4pt} & \large{\@studnamec} \\
                            \ifthenelse{\equal{\@studnamed}{}}%
                            {% Три
                                \ifthenelse{\equal{\@teachername}{}}%
                                {}%
                                {
                                    \rule{0pt}{2em}\large{Проверил} \\ \large{\@teacherid} & \rule{30mm}{0.4pt} & \large{\@teachername} \\
                                }
                                \vspace{5.2em}
                            }%
                            {
                                \rule{0pt}{1.3em}                                      & \rule{30mm}{0.4pt} & \large{\@studnamed} \\
                                \ifthenelse{\equal{\@studnamee}{}}%
                                {% Четыре
                                    \ifthenelse{\equal{\@teachername}{}}%
                                    {}%
                                    {
                                        \rule{0pt}{2em}\large{Проверил} \\ \large{\@teacherid} & \rule{30mm}{0.4pt} & \large{\@teachername} \\
                                    }
                                    \vspace{3.9em}
                                }%
                                {
                                    \rule{0pt}{1.3em}                                      & \rule{30mm}{0.4pt} & \large{\@studnamee} \\
                                    \ifthenelse{\equal{\@studnamef}{}}%
                                    {% Пять
                                        \ifthenelse{\equal{\@teachername}{}}%
                                        {}%
                                        {
                                            \rule{0pt}{2em}\large{Проверил} \\ \large{\@teacherid} & \rule{30mm}{0.4pt} & \large{\@teachername} \\
                                        }
                                        \vspace{2.6em}
                                    }%
                                    {
                                        \rule{0pt}{1.3em}                                      & \rule{30mm}{0.4pt} & \large{\@studnamef} \\
                                        \ifthenelse{\equal{\@studnameg}{\empty}}%
                                        {% Шесть
                                            \ifthenelse{\equal{\@teachername}{}}%
                                            {}%
                                            {
                                                \rule{0pt}{2em}\large{Проверил} \\ \large{\@teacherid} & \rule{30mm}{0.4pt} & \large{\@teachername} \\
                                            }
                                            \vspace{1.3em}
                                        }%
                                        {
                                            \rule{0pt}{1.3em}                                      & \rule{30mm}{0.4pt} & \large{\@studnameg} \\
                                            % Семь
                                            \ifthenelse{\equal{\@teachername}{}}%
                                            {}%
                                            {
                                                \rule{0pt}{2em}\large{Проверил} \\ \large{\@teacherid} & \rule{30mm}{0.4pt} & \large{\@teachername} \\
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                \end{tabular}
            \end{table}
        \end{minipage}
    \end{flushright}

    \ifthenelse{\equal{\@city}{}}%
    {}%
    {
        \vspace{6em}
        \begin{center}
            \large{\vspace{-1em}\@city}
        \end{center}
    }
    \newpage
    \pagestyle{plain}
}


%%%%%%% Users environments %%%%%%%
\newenvironment{info}                            %% Окружение info
    {\begin{quotation} \footnotesize }
    {\end{quotation}}

%%%%%%% The definition for the bibliography %%%%%%%
\RequirePackage[%                                %% Стиль библиографии по ГОСТ 7.0.5-2008
                autolang=other,     %
                bibencoding=utf8,   %
                maxbibnames=4,      %
                minbibnames=2,      %
                % sorting=none,       %
                sorting=nty,        %
                style=gost-numeric, %
                backend=biber]{biblatex}
\addbibresource{./cite/LibraryDB.bib}            %% База библиографии
\AtEveryBibitem{\let\mkbibemph\textbf}           %% Выделение текста в библиографии жирным (не курсивом)

\defbibheading{bibliography}[\refname]{%         %% Настройка заголовка "Список литературы"
  \begin{flushleft}
    \vspace{-2.5em}
    \Large\textup{\hspace*{0.05em}\textbf #1}
    \vspace{-1.0em}
  \end{flushleft}
  \nopagebreak
}

\ifxetex                                         %% Оставляем в списке литературы
    %% I.                                        %% кирилические интернет адреса в
    \DeclareSourcemap{                           %% читабельном виде (не punycode).
        \maps[datatype=bibtex,overwrite=true]{   %% Реализуемо только в xelatex.
            \map{                                %% Кракозяблы в \url с кириллицей.
                \step[fieldsource=url, fieldtarget=verba]
            }
        }
    }
    %% II.
    \renewbibmacro*{url+urldate}{%
        \printfield{verba}%
        \iffieldundef{urlyear}
            {}
            {\setunit*{\addspace}%
             \printurldate}}
    %% III.
    \DeclareFieldFormat{verba}{\mkbibacro{URL}\addcolon\space\url{#1}}
\fi

\RequirePackage{titlesec}                              %% Изменение шрифта заголовков разделов, глав и т.д.
\titleformat{\section}[block]
    {\normalfont\Large\bfseries}%
        { \thesection. }{0pt}{\Large}[\vspace{-0.5em}]

\titleformat{\subsection}[block]                       %% заголовков
    {\normalfont\large\bfseries}%                      %% частей
        { \thesubsection. }{0pt}{\large}[]

\RequirePackage{textcase}                              %% Прописные буквы \MakeTextUppercase{}
