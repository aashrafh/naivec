%{
    #include<stdlib.h>
    #include "parser.tab.h"
    void yyerror(char *s);
%}

%%

int         return INT;
bool        return BOOLEAN;
char        return CHARACTER;
float       return FLOAT;
string      return STRING;
const       return CONSTANT;
void        return VOID;

if          return IF;
else        return ELSE;
switch      return SWITCH;
case        return CASE;
default     return DEFAULT;
for         return FOR;
do          return DO;
while       return WHILE; 
break       return BREAK; 
continue    return CONTINUE;
return      return RETURN;

[+-]?[[:digit:]]+                           return INT_TYPE;
([0-9]*[.])?[0-9]+                          return FLOAT_TYPE;
['][a-zA-Z][']                              return CHARACTER_TYPE;
"false"                                     return BOOLEAN_TYPE;
"true"                                      return BOOLEAN_TYPE;
[a-zA-Z\_][0-9a-zA-Z\_]*                    return IDENTIFIER;
\"[\x23-\x7E =\?!\*()<>+/^%~|&@#;{}.]*\"    return STRING_TYPE;
[-+*/%&|^~!<>(){}[:\]]                      return yytext[0];

"=="          return EQUAL;
"!="          return NOT_EQUAL;
">"           return GREATER_THAN;
"<"           return LESS_THAN;
">="          return GREATER_EQUAL;
"<="          return LESS_EQUAL;
"&&"          return AND;
"||"          return OR;
"!"           return NOT;
"="           return ASSIGNMENT;
";"           return SEMICOLON;
","           return COMMA;


[ \t\n]+      ;


%%

/* 
* Called whenever the scanner reaches the end of file. 
* If yywrap() returns 1, the scanner continues with normal wrapup on the end of input. 
*/
int yywrap(void) {
    return 1;
}