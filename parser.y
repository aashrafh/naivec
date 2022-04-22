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

%token IDENTIFIER;

/* types */
%token INT BOOLEAN CHARACTER FLOAT STRING CONSTANT VOID

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
%left ifpred

%start program

%%

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



while loops
if statements
for loops
switch statements
variables and constants declaration
math and logical expression

assignment statements
else statements
*/

program:
        | statements                                {printf("statements");}
        ;

statements: statement                               {printf("statement\n");}                                            
        | statements statement                      {printf("statements -> statement");}
        | block_statement                           {printf("block statement");}
        | statements block_statement                {printf("statements -> block statement");}
        ;

statement: ';'                                      {;}
        | while_statement                           {;}
        | if_statement                              {printf("If statement\n");}
        | for_statement                             {;}
        | declaration_statement                     ';' {printf("variable declaration\n");}
        | expression_statement                      ';' {;}
        ;

block_statement: '{' '}'        {;}
        | '{' statements '}'    {;}
        ;

while_statement: WHILE '(' expression_statement ')' block_statement {;}
        ;

if_statement: matched_if                            {printf("matched if\n");}
        | unmatched_if                              {printf("unmatched if\n");}
        ;

matched_if: IF '(' expression_statement ')' '{' statements '}' ELSE '{' matched_if '}' %prec ifpred         {printf("matched_if\n");}
        | statements            {printf("matched_if statements");}
        |                       {printf("matched_if empty\n");}
        ;

unmatched_if: IF '(' expression_statement ')' '{' statements '}'            {printf("unmatched_if");}
        | IF '(' expression_statement ')' '{' matched_if '}' ELSE '{' unmatched_if '}' {printf("matched_if\n");}
        ;

for_statement: FOR '(' for_iterator ';' expression_statement ';' expression_statement ')' block_statement           {;}
        ;

for_iterator: expression_statement          {;}
        | declaration_statement             {;}
        ;

data_type: INT      {;}
        | FLOAT     {;}
        | BOOLEAN   {;}
        | CHARACTER {;}
        | STRING    {;}
        ;

declaration_statement: data_type IDENTIFIER                         {printf("variable declaration");}
        | data_type IDENTIFIER '=' expression_statement             {;}
        | CONSTANT data_type IDENTIFIER '=' expression_statement    {;}
        ;

data_value: INT_TYPE        {;}
        | FLOAT_TYPE        {;}
        | BOOLEAN_TYPE      {;}
        | CHARACTER_TYPE    {;}
        | STRING_TYPE       {;}
        ;

expression_statement: '(' expression_statement ')'                  {;}
        | IDENTIFIER                                                {printf("identifier");}
        | data_value                                                {;}
        | logical_expression                                        {;}
        ;

logical_expression: expression_statement '=' expression_statement       {printf("assignment");}
        | expression_statement '+' expression_statement                 {;}
        | expression_statement '-' expression_statement                 {;}
        | expression_statement '*' expression_statement                 {;}
        | expression_statement '/' expression_statement                 {;}
        | expression_statement AND expression_statement                 {;}
        | expression_statement OR expression_statement                  {;}
        | expression_statement GREATER_THAN expression_statement        {;}
        | expression_statement LESS_THAN expression_statement           {;}
        | expression_statement GREATER_EQUAL expression_statement       {;}
        | expression_statement LESS_EQUAL expression_statement          {;}
        | expression_statement EQUAL expression_statement               {;}
        | expression_statement NOT_EQUAL expression_statement           {;}
        ;


%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
