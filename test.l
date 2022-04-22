%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
int         return INT;
bool        return BOOLEAN;
char        return CHARACTER;
float       return FLOAT;
string      return STRING;
=           return EQUAL;
[-+*/{}~^&|(),:=%]                          return yytext[0];
true|false                                  yylval=!strcmp(yytext,"true"); return BOOLEAN_TYPE;
[;]                                         return SEMICOLON;
[+-]?[0-9]+                                 yylval=atoi(yytext); return INT_TYPE;
[+-]?[0-9]*\.[0-9]+                         yylval=strdup(yytext); return FLOAT_TYPE;
['][a-zA-Z][']                              yylval=yytext[1]; return CHARACTER_TYPE;
\"[\x23-\x7E =\?!\*()<>+/^%~|&@#;{}.]*\"    yylval=strdup(yytext+1);return STRING_TYPE;
[a-zA-Z\_][0-9a-zA-Z\_]*                    return IDENTIFIER;
\n                                          /* ignore end of line */;
[ \t]+                                      /* ignore whitespace */;
%%
