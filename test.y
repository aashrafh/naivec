%{
#include <stdio.h>
#include <string.h>

void yyerror(const char *str)
{
	fprintf(stderr,"error: %s\n",str);
}

int yywrap()
{
	return 1;
}

main()
{
	yyparse();
}

%}

%token INT BOOLEAN CHARACTER FLOAT STRING EQUAL INT_TYPE FLOAT_TYPE CHARACTER_TYPE STRING_TYPE IDENTIFIER BOOLEAN_TYPE SEMICOLON

%%

command:
    commands command
    | commands
    ;
commands:
    assignment SEMICOLON { printf("assignment\n");}
    | 
    declaration SEMICOLON { printf("declaration\n");}
    ;
assignment:
	INT IDENTIFIER EQUAL INT_TYPE 
    | FLOAT IDENTIFIER EQUAL FLOAT_TYPE 
    | FLOAT IDENTIFIER EQUAL INT_TYPE 
    | BOOLEAN IDENTIFIER EQUAL BOOLEAN_TYPE ]
    | CHARACTER IDENTIFIER EQUAL CHARACTER_TYPE 
    | STRING IDENTIFIER EQUAL STRING_TYPE 
    ;
declaration : 
    INT IDENTIFIER 
    | FLOAT IDENTIFIER
    | BOOLEAN IDENTIFIER 
    | CHARACTER IDENTIFIER 
    | STRING IDENTIFIER 
	;
