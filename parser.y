%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(char *s);
    int yylex();
%}

%union {
    int inVal;
    bool boolVal;
    char charVal;
    float floatVal;
    char* stringVal;
}

/* types */
%token INT BOOLEAN CHARACTER FLOAT STRING

/* values */
%token INT_TYPE BOOLEAN_TYPE CHARACTER_TYPE FLOAT_TYPE STRING_TYPE

/* operators */
%token AND OR NOT
%token EQUAL NOT_EQUAL GREATER_THAN LESS_THAN GREATER_EQUAL LESS_EQUAL

/* control */
%token IF ELSE WHILE FOR DO SWITCH CASE DEFAULT BREAK FUNCTION RETURN

/* precedence and associativity rules */
%right '='
%right NOT
%left AND OR
%left EQUAL NOT_EQUAL GREATER_THAN LESS_THAN GREATER_EQUAL LESS_EQUAL
%left '-' '+' '*' '/' '%' '^'

%start program

/*
rules should cover: 
variables and constants declaration
math and logical expression
assignment statements
if statements
else statements
while loops
for loops
switch statements
*/
