%{
	#include "syntaxique.tab.h"
	int line = 1;
	int column = 0;
%}

letter [A-Za-z]
digit [0-9]
IDF {letter}({letter}|{digit})*
CST {digit}+
%%

"import" return import_keyword;
"math" return math_library;
"lang" return lang_library;

"Programme" return program_keyword;
"Pdec" return declaration_keyword;

"InDebut" return begin_keyword;
"InFin" return end_keyword;

"integer" return integer_keyword;
"float" return float_keyword;

"," return comma;
";" return semicolon;
"=" return assignment_symbol;

{IDF} return idf;
{CST} return cst;

[ \t] {column += yyleng;}
\n { line++;  column = 0;}
. {printf("lexical error, line %d , column %d\n", line, column); }
%%  
int yywrap() {return 1;}
