%{
	#include<stdio.h>
	extern int line;
	extern int column;
	void yyerror(char* message) {
		printf("syntax error, line %d : %s", line, column, message);
	}
	int yylex(void);
%}
%token import_keyword math_library lang_library
%token program_keyword declaration_keyword
%token begin_keyword end_keyword
%token integer_keyword float_keyword;
%token comma semicolon assignment_symbol
%token idf cst

%start s

%%

s: import_part program_keyword declaration_keyword declaration_part begin_keyword body end_keyword {printf("syntax is correct"); YYACCEPT;}
;


import_part: single_import import_part
		   | 
;
single_import: import_keyword library libraries semicolon
;
libraries: comma library libraries
		 | 
;
library: math_library
       | lang_library
;


declaration_part: single_declaration declarations
                | 
;
single_declaration: type_keyword idf variables semicolon
;
declarations: comma idf declarations
            | 
;
variables: comma idf variables
         | 
;
type_keyword: integer_keyword
            | float_keyword
;


body: assignment_operation
;

assignment_operation: idf assignment_symbol idf semicolon
;


