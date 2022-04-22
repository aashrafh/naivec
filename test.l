%{
#include <stdio.h>
#include "test.tab.h"
%}
%%
int         return INT;
bool        return BOOLEAN;
char        return CHARACTER;
float       return FLOAT;
string      return STRING;
=           return EQUAL;
[-+*/{}~^&|(),:=%]                         return yytext[0];
false                                       return BOOLEAN_TYPE;
true                                        return BOOLEAN_TYPE;
[;]                                         return SEMICOLON;
[+-]?[[:digit:]]+                           yylval=atoi(yytext); return INT_TYPE;
([0-9]*[.])?[0-9]+                          return FLOAT_TYPE;
['][a-zA-Z][']                              return CHARACTER_TYPE;
\"[\x23-\x7E =\?!\*()<>+/^%~|&@#;{}.]*\"    return STRING_TYPE;
[a-zA-Z\_][0-9a-zA-Z\_]*                    return IDENTIFIER;
\n                                          /* ignore end of line */;
[ \t]+                                      /* ignore whitespace */;
%%
