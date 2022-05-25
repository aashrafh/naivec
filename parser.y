%{
    #include<stdio.h>
    #include<stdlib.h>
    #include <string.h>
    #include "parser.h"
    void yyerror(char *s);
    int yylex();
    void addToSymbolTable(void * value, char* name , int type);
    int getValue(int i);
    int inTable(char* name);
    idEnum getType( int i);
    void update(int i , void* value , idEnum type);
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
%token IF ELSE SWITCH CASE DEFAULT FOR DO WHILE BREAK CONTINUE RETURN PRINT

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
        | print_func
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

data_type: INT { $$ = 1; }
        | FLOAT { $$ = 2; }
        | BOOLEAN { $$ = 3; }
        | CHARACTER { $$ = 4; }
        | STRING { $$ = 5; }
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

declaration_statement: data_type IDENTIFIER { addToSymbolTable(0,(char*)($2),$1);}
        | data_type IDENTIFIER ASSIGNMENT expression_statement{ addToSymbolTable(&($4),(char*)($2),$1);}
        | CONSTANT data_type IDENTIFIER
        | CONSTANT data_type IDENTIFIER ASSIGNMENT expression_statement
        ;

assignment_statement : IDENTIFIER ASSIGNMENT expression_statement
                        {
                                int i = inTable((char*)($1));
                                idEnum type = getType(i);
                                update(i,&($3),type);
                        }
                      |IDENTIFIER ASSIGNMENT assignment_statement

expression_statement: math_expression {$$ = $1;}
        | logical_expression  {printf("logical expression\n"); $$ = $1;}  
        
        ;
math_expression:  expression_statement '+' term { printf("addition\n") ;$$ = $1 + $3;}  
        | expression_statement '-' term { printf("subtraction\n") ; $$ = $1 - $3;}  
        | term
        ;
term :    term '*' factor {printf("multiplication\n") ; $$ = $1 * $3;}  
        | term '/' factor  
        {
                printf("division\n"); 
                if ((int)($3) == 0)
                        yyerror("Division by zero");
                $$ = $1 / $3;
        }  
        | factor

factor :  data_value
         | IDENTIFIER { int i = inTable((char*)($1)) ;$$ = getValue(i); }
         | '(' expression_statement ')'
         |
         
logical_expression:  NOT expression_statement {$$ = ! $2 ;}
        | expression_statement AND expression_statement {$$ = $1 && $3 ;}
        | expression_statement OR expression_statement {$$ = $1 || $3 ;}
        | expression_statement GREATER_THAN expression_statement {$$ = $1 > $3 ;}
        | expression_statement LESS_THAN expression_statement {$$ = $1 < $3 ;}
        | expression_statement GREATER_EQUAL expression_statement {$$ = $1 >= $3 ;}
        | expression_statement LESS_EQUAL expression_statement {$$ = $1 <= $3 ;}
        | expression_statement EQUAL expression_statement {$$ = $1 == $3 ;}
        | expression_statement NOT_EQUAL expression_statement {$$ = $1 != $3 ;}
        ;

block_statement: '{''}'
        | '{' statements '}'
        ;

loop_block_statement : '{''}'
                      |'{' loops_statements '}'

if_statement: IF '(' declaration_or_assignment_or_expression ')' block_statement else_statement
        | IF '(' declaration_or_assignment_or_expression ')' statement else_statement
        ;

else_statement : ELSE statement
               | ELSE block_statement
               | SEMICOLON

nested_if_statement: IF '(' declaration_or_assignment_or_expression ')' loop_block_statement nested_else_statement
        | IF '(' declaration_or_assignment_or_expression ')' loops_statement nested_else_statement
        ;

nested_else_statement : ELSE loops_statement
               | ELSE loop_block_statement
               | SEMICOLON

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
        |  data_type IDENTIFIER  '('arguments')'  '{' statements RETURN expression_or_assignment SEMICOLON  '}' 
        | data_type IDENTIFIER  '('arguments')'  '{' RETURN expression_or_assignment SEMICOLON '}' 
print_func : PRINT'('expression_statement')' {}

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    exit(0);
}
int idx = 0 ;
struct nodeTypeTag symbol_table[100];
void addToSymbolTable(void * value, char* name , int type) { 
        nodeType p; 
        p.type = typeId; 
        p.id.type = typeInt;
        p.id.name = name;
        if ( type == 1)
                p.id.integer.value = *((int*)value);
        else if (type == 2)
                p.id.floatNumber.value = *((float*)value);
        else if(type == 3)
                p.id.boolean.value = *((int*)value);
        else if (type == 4)
                p.id.charcter.value = *((char*)value);
        symbol_table[idx++] = p;
} 
int inTable(char* name)
{
        for (int i =0;i < idx;i++)
                if ( !strcmp(name,symbol_table[i].id.name) )
                        return i;
        yyerror("variable used before declaration") ; 
        return -1;
} 
int getValue(int i)
{       
        if (i)
                return symbol_table[i].id.integer.value;
}
idEnum getType( int i)
{     
        if (i)
                return symbol_table[i].id.type;
}
void update(int i , void* value , idEnum type){
        if  (type == typeInt){
                symbol_table[i].id.integer.value = *((int*)value);
        }
        else if (type == typeFloat){
                symbol_table[i].id.floatNumber.value = *((float*)value);
        }
        else if (type == typeBoolean){
                symbol_table[i].id.boolean.value = *((int*)value);
        }
        else if (type == typeChar){
                symbol_table[i].id.charcter.value = *((char*)value);
        }
}
int main(void) {
    yyparse();
    return 0;
}
