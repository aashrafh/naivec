%{
    #include<stdlib.h>
    #include "y.tab.h"
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

"=="          return EQUAL;
"!="          return NOT_EQUAL;
">"           return GREATER_THAN;
"<"           return LESS_THAN;
">="          return GREATER_EQUAL;
"<="          return LESS_EQUAL;
"&&"          return AND;
"||"          return OR;
"!"           return NOT;

if          return IF;
else        return ELSE;
while       return WHILE;
for         return FOR;
do          return DO; 
switch      return SWITCH; 
case        return CASE; 
default     return DEFAULT; 
break       return BREAK; 
function    return FUNCTION; 
return      return RETURN;

[-+*/{}~^&|(),;:=%]    return yytext[0];

[+-]?[[:digit:]]+                           return INT_TYPE;
([0-9]*[.])?[0-9]+                          return FLOAT_TYPE;
['][a-zA-Z][']                              return CHARACTER_TYPE;
"false"                                     {yylval.boolVal = false; return BOOLEAN_TYPE;}
"true"                                      {yylval.boolVal = true; return BOOLEAN_TYPE;}
\"[\x23-\x7E =\?!\*()<>+/^%~|&@#;{}.]*\"    return STRING_TYPE;
[a-zA-Z\_][0-9a-zA-Z\_]*                    return IDENTIFIER;

%%

/* 
* Called whenever the scanner reaches the end of file. 
* If yywrap() returns 1, the scanner continues with normal wrapup on the end of input. 
*/
int yywrap(void) {
    return 1;
}