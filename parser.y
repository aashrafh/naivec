%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(char *s);
    int yylex();
%}


%token IDENTIFIER;
%token ASSIGNMENT;
%token SEMICOLON;
%token COMMA;
%token COLON;

/* types */
%token INT 
%token BOOLEAN 
%token CHARACTER 
%token FLOAT 
%token STRING 
%token CONSTANT 
%token VOID

/* values */
%token INT_TYPE BOOLEAN_TYPE CHARACTER_TYPE FLOAT_TYPE STRING_TYPE

/* operators */
%token AND OR NOT   
%token EQUAL NOT_EQUAL GREATER_THAN LESS_THAN GREATER_EQUAL LESS_EQUAL

/* control */
%token IF ELSE SWITCH CASE DEFAULT FOR DO WHILE BREAK CONTINUE RETURN 

/* precedence and associativity rules */

%left AND 
%left OR
%left EQUAL 
%left NOT_EQUAL 
%left GREATER_THAN 
%left LESS_THAN 
%left GREATER_EQUAL 
%left LESS_EQUAL
%left '-' '+' 
%left '*' '/' '%' '^'
%left '|'
%left '&'
%left '<' '>'
%right '='
%right ASSIGNMENT
%right NOT
%right '!' '~'
// %left ifpred
%nonassoc ELSE

%%


program: statements
        ;

statements: statement
        | statements statement
        ;

statement: declaration_or_assignment_or_expression SEMICOLON 
        | if_statement { printf("if\n");}
        | do_while_statement SEMICOLON {printf("do while statement\n");}
        | while_statement { printf("while\n");}
        | for_statement { printf("for\n");}
        | switch_statement    { printf("switch case\n");}
        | function      { printf("function\n");}
        ;  

loops_statement : CONTINUE SEMICOLON
                | BREAK SEMICOLON
                | declaration_or_assignment_or_expression SEMICOLON 
                | nested_if_statement { printf("if\n");}
                | do_while_statement SEMICOLON {printf("do while statement\n");}
                | while_statement { printf("while\n");}
                | for_statement { printf("for\n");}
                | switch_statement    { printf("switch case\n");}
                 
loops_statements : loops_statements loops_statement
                  | loops_statement

data_type: INT
        | FLOAT
        | BOOLEAN      
        | CHARACTER
        | STRING
        ;

data_value: 
        INT_TYPE
        | FLOAT_TYPE
        | BOOLEAN_TYPE 
        | CHARACTER_TYPE
        | STRING_TYPE 
        ;

expression_or_assignment : expression_statement {printf("expression\n");}
                           | assignment_statement {printf("assignment\n");}


declaration_or_assignment_or_expression : expression_or_assignment
                                        | declaration_statement {printf("declaration\n");}

declaration_statement: data_type IDENTIFIER
        | data_type IDENTIFIER ASSIGNMENT expression_statement
        | CONSTANT data_type IDENTIFIER
        | CONSTANT data_type IDENTIFIER ASSIGNMENT expression_statement
        ;

assignment_statement : IDENTIFIER ASSIGNMENT expression_statement 
                      |IDENTIFIER ASSIGNMENT assignment_statement

expression_statement: math_expression 
        | logical_expression  {printf("logical expression\n")}  
        
        ;
math_expression:  expression_statement '+' term {printf("addition\n")}  
        | expression_statement '-' term {printf("subtraction\n")}  
        | term
        ;
term :    term '*' factor {printf("multiplication\n")}  
        | term '/' factor  {printf("division\n")}  
        | factor

factor :  data_value
         | IDENTIFIER
         | '(' expression_statement ')'
         |
         
logical_expression:  NOT expression_statement
        | expression_statement AND expression_statement
        | expression_statement OR expression_statement
        | expression_statement GREATER_THAN expression_statement
        | expression_statement LESS_THAN expression_statement
        | expression_statement GREATER_EQUAL expression_statement
        | expression_statement LESS_EQUAL expression_statement
        | expression_statement EQUAL expression_statement
        | expression_statement NOT_EQUAL expression_statement
        ;

block_statement: '{''}'
        | '{' statements '}'
        ;

loop_block_statement : '{''}'
                      |'{' loops_statements '}'

if_statement: matched_if
        | unmatched_if
        ;

matched_if: unmatched_if ELSE block_statement
        | unmatched_if ELSE statement
        ;


unmatched_if: IF '(' declaration_or_assignment_or_expression ')' block_statement
        | IF '(' declaration_or_assignment_or_expression ')' statement
        ;

nested_if_statement: nested_matched_if
        | nested_unmatched_if
        ;

nested_matched_if: nested_unmatched_if ELSE loop_block_statement
        | nested_unmatched_if ELSE loops_statement
        ;


nested_unmatched_if: IF '(' declaration_or_assignment_or_expression ')' loop_block_statement
        | IF '(' declaration_or_assignment_or_expression ')' loops_statement
        ;

while_statement: WHILE '(' declaration_or_assignment_or_expression ')' loop_block_statement
        | WHILE '(' declaration_or_assignment_or_expression ')' loops_statement 
        ;
    
for_statement: for_declaration  loop_block_statement
        | for_declaration loops_statement
        ;

for_declaration: FOR '(' declaration_or_assignment_or_expression SEMICOLON declaration_or_assignment_or_expression SEMICOLON expression_or_assignment ')'


do_while_statement : DO loops_statement WHILE '('declaration_or_assignment_or_expression')'
                    | DO loop_block_statement WHILE '('declaration_or_assignment_or_expression')'
switch_statement : SWITCH '('declaration_or_assignment_or_expression')' '{' case_statement '}'

case_statement : CASE expression_or_assignment COLON loops_statements case_statement
                | DEFAULT COLON loops_statements
                | 
                ;

arguments: arguments ',' argument
        | argument
        |
        ;

argument : data_type IDENTIFIER 
        
function : VOID IDENTIFIER '('arguments')' block_statement
        |  data_type IDENTIFIER  '('arguments')'  '{' statements RETURN expression_or_assignment SEMICOLON statements '}' 
        | data_type IDENTIFIER  '('arguments')'  '{' RETURN expression_or_assignment SEMICOLON statements'}' 


%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
