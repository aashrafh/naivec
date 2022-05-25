%{
    #include<stdio.h>
    #include<stdlib.h>
    #include <string.h>
    #include "parser.h"
    void yyerror(char *s);
    int yylex();
    void addToSymbolTable(char* name , int type);
    int getValue(int i);
    int inTable(char* name);
    int getType( int i);
    void update(int i , void* value , int type);
    int checkType(int x , int y);
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
        INT_TYPE { $$ = 1 }
        | FLOAT_TYPE { $$ = 2 }
        | BOOLEAN_TYPE { $$ = 3 }
        | CHARACTER_TYPE { $$ = 4 }
        | STRING_TYPE { $$ = 5 }
        ;

expression_or_assignment : expression_statement {printf("expression\n");}
                           | assignment_statement {printf("assignment\n");}


declaration_or_assignment_or_expression : expression_or_assignment
                                        | declaration_statement {printf("declaration\n");}

declaration_statement: data_type IDENTIFIER { addToSymbolTable((char*)($2),$1);}
        | data_type IDENTIFIER ASSIGNMENT expression_statement
        {
                checkType($1,$4); 
                addToSymbolTable((char*)($2),$1);
        }
        | CONSTANT data_type IDENTIFIER
        | CONSTANT data_type IDENTIFIER ASSIGNMENT expression_statement
        ;

assignment_statement : IDENTIFIER ASSIGNMENT expression_statement
                        {
                                int i = inTable((char*)($1));
                                int type = getType(i);
                                $$ = checkType(type,$3);
                        }
                      |IDENTIFIER ASSIGNMENT assignment_statement { $$ = checkType($1,$3); }

expression_statement: math_expression { $$ = $1; }
        | logical_expression  {printf("logical expression\n"); $$ = $1;}
        | func_call  
        
        ;
math_expression:  expression_statement '+' term { $$ = checkType($1,$3); }  
        | expression_statement '-' term { $$ = checkType($1,$3); }  
        | term
        ;
term :    term '*' factor { $$ = checkType($1,$3); }  
        | term '/' factor  { $$ = checkType($1,$3); } 
        | factor { $$ = $1; }

factor :  data_value { $$ = $1 ; }
         | IDENTIFIER 
         { 
                int i = inTable((char*)($1)) ;
                $$ = getType(i); 
        }
         | '(' expression_statement ')'
         |
         
logical_expression:  NOT expression_statement { $$ = $1; }
        | expression_statement AND expression_statement { checkType($1,$3);  $$ = 3;}
        | expression_statement OR expression_statement { checkType($1,$3);  $$ = 3;}
        | expression_statement GREATER_THAN expression_statement { checkType($1,$3);  $$ = 3;}
        | expression_statement LESS_THAN expression_statement { checkType($1,$3);  $$ = 3;}
        | expression_statement GREATER_EQUAL expression_statement { checkType($1,$3);  $$ = 3;}
        | expression_statement LESS_EQUAL expression_statement { checkType($1,$3);  $$ = 3;}
        | expression_statement EQUAL expression_statement { checkType($1,$3);  $$ = 3;}
        | expression_statement NOT_EQUAL expression_statement { checkType($1,$3);  $$ = 3;}
        ;

block_statement: '{''}'
        | '{' statements '}'
        ;

loop_block_statement : '{''}'
                      |'{' loops_statements '}'

if_statement: IF '(' declaration_or_assignment_or_expression ')' block_statement else_statement {$$ = checkType($3,3);}
        | IF '(' declaration_or_assignment_or_expression ')' statement else_statement {$$ = checkType($3,3);}
        ;

else_statement : ELSE statement
               | ELSE block_statement
               | SEMICOLON

nested_if_statement: IF '(' declaration_or_assignment_or_expression ')' loop_block_statement nested_else_statement {$$ = checkType($3,3);}
        | IF '(' declaration_or_assignment_or_expression ')' loops_statement nested_else_statement {$$ = checkType($3,3);}
        ;

nested_else_statement : ELSE loops_statement
               | ELSE loop_block_statement
               | SEMICOLON

while_statement: WHILE '(' declaration_or_assignment_or_expression ')' loop_block_statement {$$ = checkType($3,3);}
        | WHILE '(' declaration_or_assignment_or_expression ')' loops_statement  {$$ = checkType($3,3);}
        ;
    
for_statement: for_declaration  loop_block_statement
        | for_declaration loops_statement
        ;

for_declaration: FOR '(' declaration_or_assignment_or_expression SEMICOLON declaration_or_assignment_or_expression SEMICOLON expression_or_assignment ')'
{
        checkType($3,$7);
        checkType($5,3);
}


do_while_statement : DO loops_statement WHILE '('declaration_or_assignment_or_expression')'{$$ = checkType($5,3);}
                    | DO loop_block_statement WHILE '('declaration_or_assignment_or_expression')' {$$ = checkType($5,3);}
switch_statement : SWITCH '('declaration_or_assignment_or_expression')' '{' case_statement '}' {$$ = checkType($3,$6);}

case_statement : CASE expression_or_assignment COLON loops_statements case_statement { $$ = $2;}
                | DEFAULT COLON loops_statements
                | 
                ;

arguments: arguments ',' argument
        | argument
        |
        ;

argument : data_type IDENTIFIER { addToSymbolTable((char*)($2),$1);}
        
function : VOID IDENTIFIER '('arguments')' block_statement
        |  data_type IDENTIFIER  '('arguments')'  '{' statements RETURN expression_or_assignment SEMICOLON  '}' {$$ = checkType($1,$9);}
        | data_type IDENTIFIER  '('arguments')'  '{' RETURN expression_or_assignment SEMICOLON '}' {$$ = checkType($1,$8);}
func_call: IDENTIFIER '('arguments')'
%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    exit(0);
}
int idx = 0 ;
struct nodeTypeTag symbol_table[100];
void addToSymbolTable(char* name , int type) { 
        nodeType p; 
        p.type = typeId;
        p.id.type = type;
        p.id.name = name;
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
int getType( int i)
{       
        return symbol_table[i].id.type;
}
int checkType(int x , int y){
        if (x != y){
                yyerror("type missmatch");  
                return 0;
        }
        return x;
}
int main(void) {
    yyparse();
    return 0;
}
