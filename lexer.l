%{
    #include<stdlib.h>
    #include "y.tab.h"
    void yyerror(char *s);
%}

%%

int     return INT;
bool    return BOOLEAN;
char    return CHARACTER;
float   return FLOAT;
string  return STRING;
const   return CONSTANT;
void    return VOID;

%%

/* 
* Called whenever the scanner reaches the end of file. 
* If yywrap() returns 1, the scanner continues with normal wrapup on the end of input. 
*/
int yywrap(void) {
    return 1;
}