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

[-+*/{}~^&|(),:=%]                          return yytext[0];
true|false                                  yylval=!strcmp(yytext,"true"); return BOOLEAN_TYPE;
[+-]?[0-9]+                                 yylval=atoi(yytext); return INT_TYPE;
[+-]?[0-9]*\.[0-9]+                         yylval=strdup(yytext); return FLOAT_TYPE;
['][a-zA-Z][']                              yylval=yytext[1]; return CHARACTER_TYPE;
\"[\x23-\x7E =\?!\*()<>+/^%~|&@#;{}.]*\"    yylval=strdup(yytext+1);return STRING_TYPE;
[a-zA-Z\_][0-9a-zA-Z\_]*                    return IDENTIFIER;



[ \t\n]+      ;


%%

/* 
* Called whenever the scanner reaches the end of file. 
* If yywrap() returns 1, the scanner continues with normal wrapup on the end of input. 
*/
int yywrap(void) {
    return 1;
}