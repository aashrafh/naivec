%{
    #include<stdio.h>
    #include<stdlib.h>
    #include <stdarg.h> 
    #include <string.h>
    #include "parser.h"
    #define typeVoid 0
    #define typeInteger 1
    #define typeFloat 2
    #define typeBoolean 3
    #define typeCharchter 4
    #define typeString 5
    #define identifierKind 1
    #define constantKind 2
	#define constantValueKind 5
    #define functionKind 3
    void yyerror(char *s);
    int yylex();
    void addToSymbolTable(char* name , int type, int kind);
    int inTable(char* name);
    int getType( int i);
    int getKind( int i);
    int checkType(int x , int y);
    int checkKind (int kind);
    void setUsed(int i);
    void opr(int oper, int nops, ...);
    int ex(struct nodeTypeTag *p) ; 
    int scope = 0;
    int scope_inc = 1;
	int idx = 0 ;
	struct nodeTypeTag symbol_table[10000];
	struct valueNodes values[10000];
	int valueIdxInsert = 0;
	int valueIdx = 0; 
	int par = 2;
	void addValue(void* value , int type);
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
	| if_statement 
	| do_while_statement SEMICOLON 
	| while_statement 
	| for_statement 
	| switch_statement    
	| function      
	;  

loops_statement : CONTINUE SEMICOLON
		| BREAK SEMICOLON
		| declaration_or_assignment_or_expression SEMICOLON 
		| nested_if_statement 
		| do_while_statement SEMICOLON 
		| while_statement 
		| for_statement 
		| switch_statement    
		 
loops_statements : loops_statements loops_statement
		  | loops_statement

data_type: INT { $$ = typeInteger; }
	| FLOAT { $$ = typeFloat; }
	| BOOLEAN { $$ = typeBoolean; }
	| CHARACTER { $$ = typeCharchter; }
	| STRING { $$ = typeString; }
	;

data_value: 
	INT_TYPE { addValue(&($1),typeInteger);$$ = typeInteger }
	| FLOAT_TYPE { addValue(&($1),typeFloat);$$ = typeFloat }
	| BOOLEAN_TYPE { addValue(&($1),typeBoolean);$$ = typeBoolean }
	| CHARACTER_TYPE { addValue(&($1),typeCharchter);$$ = typeCharchter }
	| STRING_TYPE { $$ = typeString }
	;

expression_or_assignment : expression_statement 
			   | assignment_statement 


declaration_or_assignment_or_expression : expression_or_assignment 
					| declaration_statement 

declaration_statement: data_type IDENTIFIER 
	{
		printf("\n");
		if(inTable((char*)$2) != -1)
				yyerror("this variable has been declared before");
		addToSymbolTable((char*)($2),$1,identifierKind);
	}
	| data_type IDENTIFIER ASSIGNMENT expression_statement
	{
		printf("\n");
		if(inTable((char*)$2) != -1)
			yyerror("this variable has been declared before");
		checkType($1,$4); 
		addToSymbolTable((char*)($2),$1,identifierKind);
		if(values[valueIdx].type != -1)
			opr('=', 2, (char*)($2), "$");
		else {
			opr('=', 2, (char*)($2), values[valueIdx]);
			valueIdx ++;
		}
	}
	| CONSTANT data_type IDENTIFIER ASSIGNMENT expression_statement        
	{
		if(inTable((char*)$3) != -1)
			yyerror("this variable has been declared before");
		checkType($2,$5); 
		addToSymbolTable((char*)($3),$2,constantKind);
	}
	;

assignment_statement : IDENTIFIER ASSIGNMENT expression_statement
			{
				int i = inTable((char*)($1));
				if (i == -1)
				{
					int temp = scope;
					scope = 0;
					i = inTable((char*)($1)) ;
					if (i == -1)
						yyerror("variable used before declaration") ; 
					else
					{
						checkKind(getKind(i));
						int type = getType(i);
						scope = temp;
						$$ = checkType(type,$3);
						if (par == 1){
							par =2;
							if(values[valueIdx].type != -1)
								opr('=', 1, (char*)($1));
							else {
								opr('=', 1, (char*)($1));
								valueIdx ++;
							}
						}
						else{
							if(values[valueIdx].type != -1)
								opr('=', 2, (char*)($1), "$");
							else {
								opr('=', 2, (char*)($1), values[valueIdx]);
								valueIdx ++;
							}
						}
						
					}
				}
				else{
					checkKind(getKind(i));
					int type = getType(i);
					$$ = checkType(type,$3);
					if (par == 1){
						par = 2;
							if(values[valueIdx].type != -1)
								opr('=', 1, (char*)($1));
							else {
								opr('=', 1, (char*)($1));
								valueIdx ++;
							}
						}
						else{
							if(values[valueIdx].type != -1)
								opr('=', 2, (char*)($1), "$");
							else {
								opr('=', 2, (char*)($1), values[valueIdx]);
								valueIdx ++;
							}
						}
				}
			}
		      |IDENTIFIER ASSIGNMENT assignment_statement 
			{
				int i = inTable((char*)($1));
				if (i == -1)
				{
					int temp = scope;
					scope = 0;
					i = inTable((char*)($1)) ;
					if (i == -1)
						yyerror("variable used before declaration") ; 
					else
					{
						checkKind(getKind(i));
						int type = getType(i);
						scope = temp;
						$$ = checkType(type,$3);
					}
				}
				else{
					checkKind(getKind(i));
					int type = getType(i);
					$$ = checkType(type,$3);
				} 
			}

expression_statement: math_expression { $$ = $1; }
	| logical_expression  {$$ = $1;}
	| function_call  { $$ = $1;}
	
	;
math_expression:  expression_statement '+' term 
	{
		if (par == 1){
			if(values[valueIdx].type != -1)
				opr('+', 1,  "$");
			else {
				opr('+', 1, values[valueIdx]);
				valueIdx ++;
			}
		}
		else{
			if(values[valueIdx].type != -1 && values[valueIdx+1].type != -1){
				opr('+', 2, "$", "$");
			}
			else if (values[valueIdx].type != -1) {
				opr('+', 2, "$", values[valueIdx+1].name);
				valueIdx ++;
			}
			else if (values[valueIdx+1].type != -1){
				opr('+', 2, values[valueIdx].name, "$"); 
				valueIdx ++;
			}
			else{
				opr('+', 2, values[valueIdx].name, values[valueIdx+1].name);
				valueIdx += 2;
			}
			// char w = '%';
			// addValue(&w,typeCharchter);
			//valueIdx --;
			par =1;
		}
		$$ = checkType($1,$3); 
	}  
	| expression_statement '-' term 
	{ 
		if (par == 1){
			if(values[valueIdx].type != -1)
				opr('-', 1,  "$");
			else {
				opr('-', 1, values[valueIdx]);
				valueIdx ++;
			}
		}
		else{
			if(values[valueIdx].type != -1 && values[valueIdx+1].type != -1){
				opr('-', 2, "$", "$");
			}
			else if (values[valueIdx].type != -1) {
				opr('-', 2, "$", values[valueIdx+1].name);
				valueIdx ++;
			}
			else if (values[valueIdx+1].type != -1){
				opr('-', 2, values[valueIdx].name, "$"); 
				valueIdx ++;
			}
			else{
				opr('-', 2, values[valueIdx].name, values[valueIdx+1].name);
				valueIdx += 2;
			}
			// char w = '%';
			// addValue(&w,typeCharchter);
			//valueIdx --;
			par =1;
		}
		$$ = checkType($1,$3); 
	}  
	| term
	;
term :    term '*' factor { $$ = checkType($1,$3); }  
	| term '/' factor  { $$ = checkType($1,$3); } 
	| factor { $$ = $1; }

factor :  data_value { $$ = $1 ; }
	 | IDENTIFIER 
	{ 
		int i = inTable((char*)($1)) ;
		if (i == -1)
		{
			int temp = scope;
			scope = 0;
			i = inTable((char*)($1)) ;
			if (i == -1)
				yyerror("variable used before declaration") ; 
			else
			{
				setUsed(i);
				$$ = getType(i);
				scope = temp;
								addValue((char*)$1,-1);
			}
		}
		else{
			setUsed(i);
			$$ = getType(i); 
						addValue((char*)$1,-1);
		}
	}
	 | '(' expression_statement ')'{$$ = $2;}
	 | { $$ = -1; }
	 
logical_expression:  NOT expression_statement { $$ = $1; }
	| expression_statement AND expression_statement { checkType($1,$3);  $$ = typeBoolean;}
	| expression_statement OR expression_statement { checkType($1,$3);  $$ = typeBoolean;}
	| expression_statement GREATER_THAN expression_statement { checkType($1,$3);  $$ = typeBoolean;}
	| expression_statement LESS_THAN expression_statement { checkType($1,$3);  $$ = typeBoolean;}
	| expression_statement GREATER_EQUAL expression_statement { checkType($1,$3);  $$ = typeBoolean;}
	| expression_statement LESS_EQUAL expression_statement { checkType($1,$3);  $$ = typeBoolean;}
	| expression_statement EQUAL expression_statement { checkType($1,$3);  $$ = typeBoolean;}
	| expression_statement NOT_EQUAL expression_statement { checkType($1,$3);  $$ = typeBoolean;}
	;

block_statement :  '{''}'  
	|   '{' statements '}'  
	;

loop_block_statement : '{''}'
		      |'{' loops_statements'}'

if_statement: IF '(' declaration_or_assignment_or_expression ')' {scope = scope_inc;} block_statement else_statement {$$ = checkType($3,typeBoolean); scope = 0; scope_inc += 1;}
	| IF '(' declaration_or_assignment_or_expression ')' {scope = scope_inc;} statement else_statement {$$ = checkType($3,typeBoolean); scope = 0; scope_inc += 1;}
	;

else_statement : ELSE statement
	       | ELSE block_statement
	       | SEMICOLON

nested_if_statement: IF '(' declaration_or_assignment_or_expression ')' {scope = scope_inc;} loop_block_statement nested_else_statement {$$ = checkType($3,typeBoolean); scope = 0; scope_inc += 1;}
	| IF '(' declaration_or_assignment_or_expression ')' {scope = scope_inc;} loops_statement nested_else_statement {$$ = checkType($3,typeBoolean); scope = 0; scope_inc += 1;}
	;

nested_else_statement : ELSE loops_statement
	       | ELSE loop_block_statement
	       | SEMICOLON

while_statement: WHILE  '(' declaration_or_assignment_or_expression ')' {scope = scope_inc;} loop_block_statement {$$ = checkType($3,typeBoolean); scope = 0; scope_inc += 1;}
	| WHILE  '(' declaration_or_assignment_or_expression ')' {scope = scope_inc;} loops_statement  {$$ = checkType($3,typeBoolean); scope = 0; scope_inc += 1;}
	;
    
for_statement: for_declaration  loop_block_statement
	| for_declaration loops_statement
	;

for_declaration: FOR {scope = scope_inc;}'(' declaration_or_assignment_or_expression SEMICOLON declaration_or_assignment_or_expression SEMICOLON expression_or_assignment ')'
			{ checkType($6,typeBoolean); scope = 0; scope_inc += 1;}


do_while_statement : DO {scope = scope_inc;} loops_statement WHILE '('declaration_or_assignment_or_expression')'{$$ = checkType($6,typeBoolean); scope = 0; scope_inc += 1;}
		    | DO {scope = scope_inc;}loop_block_statement WHILE '('declaration_or_assignment_or_expression')' {$$ = checkType($6,typeBoolean); scope = 0; scope_inc += 1;}
switch_statement : SWITCH {scope = scope_inc;}'('declaration_or_assignment_or_expression')' '{' case_statement '}' 
{
	if ($$ != -1)
		$$ = checkType($4,$7); 
	scope = 0; scope_inc += 1;
}

case_statement : CASE expression_or_assignment COLON loops_statements case_statement { $$ = $2;}
		| DEFAULT COLON loops_statements { $$ = -1;}
		| { $$ = -1;}
		;

arguments: arguments ',' argument 
	| argument 
	|
	;

argument : data_type IDENTIFIER { scope = scope_inc; addToSymbolTable((char*)($2),$1,identifierKind);}
	
function : VOID IDENTIFIER '(' arguments')'  block_statement 
	{
		if(inTable((char*)$2) != -1)
			yyerror("this function has been declared before");
		scope = 0; scope_inc += 1;
		addToSymbolTable((char*)($2),typeVoid,functionKind);
	}
	|  data_type IDENTIFIER  '(' arguments')'  '{' statements RETURN expression_or_assignment SEMICOLON '}' 
	{
		if(inTable((char*)$2) != -1)
			yyerror("this function has been declared before");
		$$ = checkType($1,$9); 
		scope = 0; scope_inc += 1;
		addToSymbolTable((char*)($2),$1,functionKind); 
	}
	| data_type IDENTIFIER  '(' arguments')' '{'  RETURN expression_or_assignment SEMICOLON   '}'
	{
		if(inTable((char*)$2) != -1)
			yyerror("this function has been declared before");
		$$ = checkType($1,$8); 
		scope = 0; scope_inc += 1;
		addToSymbolTable((char*)($2),$1,functionKind); 
	}


function_call: IDENTIFIER '('arguments')' 
	{
		int i = inTable((char*)($1));
		if (i == -1)
			yyerror("there is no function declared with this name") ; 
		if (getKind(i) != functionKind)
			yyerror("identifier is not a funcion");
		$$ = getType(i);
	}
%%


void addValue(void* value , int type)
{
	struct valueNodes p;
	p.type = type;
	if (type == typeInteger)
		p.integer = *((int *)value);
	else if (type == typeFloat)
		p.floatNumber = *((float *)value);
	else if (type == typeBoolean)
		p.boolean = *((int *)value);
	else if (type == typeCharchter)
		p.character = *((char *)value);
	else
		p.name = (char*)value;
	values[valueIdxInsert++] = p;
}





void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    exit(0);
}
void addToSymbolTable(char* name , int type, int kind) { 
	struct nodeTypeTag p; 
	p.isUsed = 0;
	p.type = type;
	p.kind = kind;
	p.name = name;
	p.scope = scope;
	symbol_table[idx++] = p;
} 
int inTable(char* name)
{
	for (int i =0;i < idx;i++)
		if ( !strcmp(name,symbol_table[i].name) && symbol_table[i].scope == scope )
			return i;      
	return -1;
} 
int getType(int i)
{       
	return symbol_table[i].type;
}
int getKind(int i)
{
	return symbol_table[i].kind;
}
void setUsed(int i)
{
	symbol_table[i].isUsed = 1;
}
int checkType(int x , int y){
	if (x == -1)
		return y;
	else if (y == -1)
		return x;
	if (x != y){
		yyerror("type missmatch");  
		return 0;
	}
	return x;
}
int checkKind (int kind)
{
	if (kind == 2)
		yyerror("constant cannot be modified");  
	if (kind == 3)
		yyerror("function cannot be modified");  
	return kind;
}
void opr(int oper, int nops, ...) {
	struct nodeTypeTag p; 
	p.isUsed = 1;
	p.kind = 4;
	va_list ap;   
	p.opr.oper = oper; 
	p.opr.nops = nops; 
		char* n[nops];
	va_start(ap, nops); 
	for (int i = 0; i < nops; i++){
		n[i]= va_arg(ap, char*);
		if(!strcmp(n[i],"%"))
			continue;
		if(!strcmp(n[i],"$")){
					struct nodeTypeTag *p1;
					size_t nodeSize; 
					/* allocate node */ 
					nodeSize =  10 + sizeof(oprNodeType); 
					if ((p1 = malloc(nodeSize)) == NULL) 
					yyerror("out of memory");
					p1->kind = constantValueKind;
					p1->type = values[valueIdx].type;
					if (p1->type == typeInteger)
							p1->value = &(values[valueIdx].integer);
					else if (p1->type == typeFloat)
							p1->value = &(values[valueIdx].floatNumber);
					else if (p1->type == typeBoolean)
							p1->value = &(values[valueIdx].boolean);
					else if (p1->type == typeCharchter)
							p1->value = &(values[valueIdx].character);
					p.opr.op[i] = p1;
					valueIdx ++;
		}
		else{
			int place = inTable(n[i]);
			if(place == -1){
				int temp = scope;
				scope = 0 ;
				place = inTable(n[i]);
				if(place == -1)
					yyerror("variable used before declaration") ; 
				else{
					scope = temp;
					p.opr.op[i] = &symbol_table[place];
				}
			}
			else{
				p.opr.op[i] = &symbol_table[place];
			}
		}
	} 
	
	va_end(ap);
	symbol_table[idx++] = p;
} 
//----------------------------------------------
static int lbl; 
int ex(nodeType *p) { 
	int lbl1, lbl2;  
	switch(p->kind) {
		case constantValueKind:
			if (p->type == typeInteger) 
				printf("\tpush\t%d\n", *((int*)p->value)); 
			if (p->type == typeFloat) 
				printf("\tpush\t%d\n", *((float*)p->value));
			if (p->type == typeBoolean) 
				printf("\tpush\t%d\n", *((int*)p->value));
			if (p->type == typeCharchter) 
				printf("\tpush\t%s\n", *((char*)p->value));
			break;
		case constantKind: 
			printf("\tpush\t%s\n", p->name); 
			break; 
		case identifierKind: 
			printf("\tpush\t%s\n", p->name); 
			break; 
		case 4:
			switch(p->opr.oper){
				case '=':
					if(p->opr.nops > 1)
						ex(p->opr.op[1]); 
					printf("\tpop\t%s\n", p->opr.op[0]->name); 
					break; 
				default: 
					ex(p->opr.op[0]);
					if(p->opr.nops > 1) 
						ex(p->opr.op[1]); 
					switch(p->opr.oper) { 
					case '+': printf("\tadd\n"); break; 
					case '-': printf("\tsub\n"); break; 
					case '*': printf("\tmul\n"); break; 
					case '/': printf("\tdiv\n"); break; 
					case '<': printf("\tcompLT\n"); break; 
					case '>': printf("\tcompGT\n"); break; 
					// case "GE": printf("\tcompGE\n"); break; 
					// case "LE": printf("\tcompLE\n"); break; 
					// case "NE": printf("\tcompNE\n"); break; 
					// case "EQ": printf("\tcompEQ\n"); break; 
					} 
				}
		} 
	return 0; 
}  



//------------------------------------------------
int main(void) {
    yyparse();
    for (int i=0;i<idx;i++){
		if(symbol_table[i].kind == 4)
		{
			ex(&(symbol_table[i]));
		}
    }
    for (int i=0;i<idx;i++)
    {
	if (symbol_table[i].isUsed == 0)
	{
		printf("%s is not used\n",symbol_table[i].name);
	}
    }
    return 0;
}
