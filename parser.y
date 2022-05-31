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
	typedef struct yy_buffer_state * YY_BUFFER_STATE;
    void yyerror(char *s);
    int yylex();
    void addToSymbolTable(char* name , int type, int kind);
    int inTable(char* name);
    int getType( int i);
    int getKind( int i);
    int checkType(int x , int y , int errorType);
    int checkKind (int kind);
    void setUsed(int i);
	int Operations (char operation,int par1, int par2,int setPar, int setMulLvl);
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
	int addSubLvl = 0;
	int mulDivLvl = 0;
	void addValue(void* value , int type);
	void addToOperation (char operation, char* par1, char* par2);
	char * readFile(char* fileName); 
	int ext = 0;   
	FILE *outFilePtr;
	YY_BUFFER_STATE yy_scan_string(char * );
	void yy_delete_buffer(YY_BUFFER_STATE buffer);
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

%left AND OR
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
	| FLOAT_TYPE { const char* y = (char*)$1 ;float x = atof(y);addValue(&(x),typeFloat);$$ = typeFloat }
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
		if(inTable((char*)$2) != -1)
			yyerror("this variable has been declared before");
		addToSymbolTable((char*)($2),$1,identifierKind);
	}
	| data_type IDENTIFIER ASSIGNMENT expression_statement
	{
		valueIdx = valueIdxInsert - 1;
		if(inTable((char*)$2) != -1)
			yyerror("this variable has been declared before");
		checkType($1,$4,1); 
		addToSymbolTable((char*)($2),$1,identifierKind);
		addToOperation('=', (char*)($2), "$");
		mulDivLvl = 0;
		par = 2;
	}
	| CONSTANT data_type IDENTIFIER ASSIGNMENT expression_statement        
	{
		valueIdx = valueIdxInsert - 1;
		if(inTable((char*)$3) != -1)
			yyerror("this variable has been declared before");
		checkType($2,$5,2); 
		addToSymbolTable((char*)($3),$2,constantKind);
		addToOperation('=', (char*)($3), "$");
		mulDivLvl = 0;
		par = 2;
	}
	;

assignment_statement : IDENTIFIER ASSIGNMENT expression_statement
			{
				valueIdx = valueIdxInsert - 1;
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
						$$ = checkType(type,$3,1);
						addToOperation('=', (char*)($1), "$");
					}
				}
				else{
					checkKind(getKind(i));
					int type = getType(i);
					$$ = checkType(type,$3,1);
					addToOperation('=', (char*)($1), "$");
				}
				mulDivLvl = 0;
				par = 2;
			}

expression_statement: math_expression { $$ = $1; }
	| logical_expression  {$$ = $1;}
	| '(' expression_statement ')'{par = 2;$$ = $2;}
	| function_call  { $$ = $1;}
	;

math_expression:  expression_statement '+' term {$$ = Operations('+',(int)$1,(int)$3,1,0); }  
	| expression_statement '-' term {	$$ = Operations('-',(int)$1,(int)$3,1,0); } 
	| term { $$ = $1;}
	;
term :term '*' factor { $$ = Operations('*',(int)$1,(int)$3,1,1); }  
	| term '/' factor  { $$ = Operations('/',(int)$1,(int)$3,1,1); }  
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
	 | { $$ = -1; }
	 
logical_expression:  NOT expression_statement {	par = 1; Operations ('!',1,1,0,0); $$ = typeBoolean; }
	| expression_statement AND expression_statement {	Operations('&',(int)$1,(int)$3,1,0);	$$ = typeBoolean; }
	| expression_statement OR expression_statement {	Operations('|',(int)$1,(int)$3,1,0);	$$ = typeBoolean; }
	| expression_statement GREATER_THAN expression_statement {	Operations('>',(int)$1,(int)$3,1,0);	$$ = typeBoolean; }
	| expression_statement LESS_THAN expression_statement {	Operations('<',(int)$1,(int)$3,1,0);	$$ = typeBoolean; }
	| expression_statement GREATER_EQUAL expression_statement {	Operations('G',(int)$1,(int)$3,1,0);	$$ = typeBoolean; }
	| expression_statement LESS_EQUAL expression_statement {	Operations('L',(int)$1,(int)$3,1,0);	$$ = typeBoolean; }
	| expression_statement EQUAL expression_statement {	Operations('E',(int)$1,(int)$3,1,0);	$$ = typeBoolean; }
	| expression_statement NOT_EQUAL expression_statement {	Operations('N',(int)$1,(int)$3,1,0);	$$ = typeBoolean; }
	;

block_statement :  '{''}'  
	|   '{' statements '}'  
	;

loop_block_statement : '{''}'
		      |'{' loops_statements'}'

if_statement: if_condition block_statement {opr('B',0);opr('i',0);}else_statement {opr('C',0); $$ = checkType($1,typeBoolean,3); scope = 0; scope_inc += 1;}
	| if_condition statement {opr('B',0);opr('i',0);}else_statement {opr('C',0); $$ = checkType($1,typeBoolean,3); scope = 0; scope_inc += 1;}
	;

if_condition : IF { opr('x',0);}'(' {scope = scope_inc; par = 2;} declaration_or_assignment_or_expression ')' {
	if(symbol_table[idx-1].kind == 4 && symbol_table[idx-1].opr.oper == 'x'){
		par = 1;
		Operations('@',1,1,0,0);
    }
	par = 2 ;
	opr('h',0); 
	$$=$5;
}

else_statement : ELSE statement
	       | ELSE block_statement
	       | SEMICOLON

nested_if_statement: IF '(' declaration_or_assignment_or_expression ')' {scope = scope_inc;} loop_block_statement nested_else_statement {$$ = checkType($3,typeBoolean,3); scope = 0; scope_inc += 1;}
	| IF '(' declaration_or_assignment_or_expression ')' {scope = scope_inc;} loops_statement nested_else_statement {$$ = checkType($3,typeBoolean,3); scope = 0; scope_inc += 1;}
	;

nested_else_statement : ELSE loops_statement
	       | ELSE loop_block_statement
	       | SEMICOLON

while_statement: while_declaraction  loop_block_statement {opr('l',0); $$ = $1; scope = 0; scope_inc += 1;}
	| while_declaraction loops_statement {opr('l',0); $$ = $1; scope = 0; scope_inc += 1;}
	;
while_declaraction : WHILE '(' { opr('w',0); scope = scope_inc; par = 2; }  declaration_or_assignment_or_expression ')' {    
	if(symbol_table[idx-1].kind == 4 && symbol_table[idx-1].opr.oper == 'w'){
        par = 1;
        Operations('@',1,1,0,0);
    }
	par = 2 ;opr('h',0); $$ = checkType($4,typeBoolean,4);
}
for_statement: for_declaration  loop_block_statement {opr('l',0); $$ = $1; scope = 0; scope_inc += 1;}
	| for_declaration loops_statement {opr('l',0); $$ = $1; scope = 0; scope_inc += 1;}
	;

for_declaration: FOR {scope = scope_inc; par = 2;}'(' declaration_or_assignment_or_expression {opr('w',0);par = 2;} SEMICOLON declaration_or_assignment_or_expression {par = 2 ;opr('f',0);} SEMICOLON expression_or_assignment ')'
				{$$ = checkType($7,typeBoolean,5);}
			
do_while_statement : DO {opr('w',0); scope = scope_inc;} loops_statement do_while_declaration {scope = 0; scope_inc += 1;}
		    | DO {opr('w',0); scope = scope_inc;} loop_block_statement do_while_declaration {scope = 0; scope_inc += 1;}

do_while_declaration : WHILE {opr('x',0);}'('  declaration_or_assignment_or_expression ')' {
	if(symbol_table[idx-1].kind == 4 && symbol_table[idx-1].opr.oper == 'x'){
        par = 1;
        Operations('@',1,1,0,0);
    }
	par = 2 ;opr('h',0); opr('l',0); $$ = checkType($4,typeBoolean,4);
	}
switch_statement : SWITCH {scope = scope_inc; opr('x',0); par = 2;}'('declaration_or_assignment_or_expression')' {Operations('#',1,1,0,0); par = 2;}'{' case_statement '}' {
	if ($$ != -1)
	$$ = checkType($4,$8,6); 
	scope = 0; scope_inc += 1;
	opr('C',0);
	par = 2;
}

case_statement : CASE {par = 2; scope = scope_inc;} expression_or_assignment {par = 1;Operations('A',0,0,0,0); par = 2;} COLON loops_statements {opr('B',0); opr('i',0); scope_inc ++; scope = 0;}case_statement { par = 2;$$ = $3; scope_inc ++; scope = 0;}
		| DEFAULT {scope = scope_inc;} COLON loops_statements { scope_inc ++; scope = 0; $$ = -1;}
		| { $$ = -1;}
		;

arguments: arguments ',' argument 
	| argument 
	|
	;

argument : data_type IDENTIFIER { scope = scope_inc; addToSymbolTable((char*)($2),$1,identifierKind);}
	
function : VOID IDENTIFIER '(' arguments')'  block_statement {
		if(inTable((char*)$2) != -1)
			yyerror("this function has been declared before");
		scope = 0; scope_inc += 1;
		addToSymbolTable((char*)($2),typeVoid,functionKind);
	}
	|  data_type IDENTIFIER  '(' arguments')'  '{' statements RETURN expression_or_assignment SEMICOLON '}' {
		if(inTable((char*)$2) != -1)
			yyerror("this function has been declared before");
		$$ = checkType($1,$9,7); 
		scope = 0; scope_inc += 1;
		addToSymbolTable((char*)($2),$1,functionKind); 
	}
	| data_type IDENTIFIER  '(' arguments')' '{'  RETURN expression_or_assignment SEMICOLON   '}'{
		if(inTable((char*)$2) != -1)
			yyerror("this function has been declared before");
		$$ = checkType($1,$8,7); 
		scope = 0; scope_inc += 1;
		addToSymbolTable((char*)($2),$1,functionKind); 
	}

argument_call: argument_call ',' factor
			| factor
			
function_call: IDENTIFIER '('argument_call')' 
	{
		int i = inTable((char*)($1));
		if (i == -1)
			yyerror("there is no function declared with this name") ; 
		else if (getKind(i) != functionKind)
			yyerror("identifier is not a funcion");
		$$ = getType(i);
	}
%%


void addValue(void* value , int type){
	struct valueNodes p;
	p.type = type;
	p.used = 0;
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
	if (ext == 0)
		fprintf( outFilePtr,"----------The file has compilation errors-----\t\n");
    fprintf(outFilePtr, "%s\n", s);
    ext = 1;
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
int inTable(char* name){
	for (int i =0;i < idx;i++)
		if (symbol_table[i].kind!=4 && !strcmp(name,symbol_table[i].name) && symbol_table[i].scope == scope)
			return i;  
	return -1;
} 
int getType(int i){
	if (i == -1)
		return -1;       
	return symbol_table[i].type;
}
int getKind(int i){
	return symbol_table[i].kind;
}
void setUsed(int i){
	symbol_table[i].isUsed = 1;
}
int checkType(int x , int y , int errorType){
	if (x == -1)
		return y;
	else if (y == -1)
		return x;
	else if (x != y){
		switch (errorType){
			case 1:
				yyerror("variable type missmatches with the assigned value "); 
				break; 
			case 2:
				yyerror("constant type missmatches with the assigned value ");  
				break;
			case 3:
				yyerror("if condition  must be of type boolean ");  
				break;
			case 4:
				yyerror("while condition must be of type boolean ");  
				break;
			case 5:
				yyerror("for condition must be of type boolean ");  
				break;
			case 6:
				yyerror("case variable type must be same as switch variable type ");  
				break;
			case 7:
				yyerror("return type must be the same as function type ");  
				break;
		}
		return -1;
	}
	return x;
}
int checkKind (int kind){
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
	p.opr.oper = oper; 
	p.opr.nops = nops; 
	va_list ap;   
	//char* n[nops];
	va_start(ap, nops); 
	for (int i = 0; i < nops; i++){
		char* x= va_arg(ap, char*);
		if (!strcmp(x,"#"))
			continue;
		if(!strcmp(x,"$")){
			while(values[valueIdx].used == 1 || values[valueIdx].type==-1){
				valueIdx ++;
			}
			values[valueIdx].used = 1;
			struct nodeTypeTag *p1;
			size_t nodeSize; 
			nodeSize =  8 + sizeof(oprNodeType); 
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
			int place = inTable(x);
			if(place == -1){
				int temp = scope;
				scope = 0 ;
				place = inTable(x);
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
	if(p.opr.oper == '/' && p.opr.nops == 2 &&((p.opr.op[1]->type == typeInteger && *(int*)(p.opr.op[1]->value) == 0)||(p.opr.op[1]->type == typeFloat && *(float*)(p.opr.op[1]->value) == 0)))
		yyerror("error: division by zero");
	if (p.opr.oper == '/' && p.opr.nops == 1 && ((p.opr.op[0]->type == typeInteger && *(int*)(p.opr.op[0]->value) == 0)||(p.opr.op[0]->type == typeFloat && *(float*)(p.opr.op[0]->value) == 0)))
			yyerror("error: division by zero");
	symbol_table[idx++] = p;
} 
//----------------------------------------------
static int lbl;
static int var;
static int sCase;
int known = 0; 
int operation = 0;
int arthLvl = -1;
int sec = 0;
int lbl1, lbl2;
int ex(nodeType *p) { 
	int inc = 1;  
	switch(p->kind) {
		case constantValueKind:
			if (p->type == typeInteger){
				fprintf( outFilePtr,"\tpush\t%d\n", *((int*)p->value)); 
				known = 1;
			} 
			else if (p->type == typeFloat) {
				fprintf( outFilePtr,"\tpush\t%f\n", *((float*)p->value));
				known = 1;
			}
			else if (p->type == typeBoolean) {
				fprintf( outFilePtr,"\tpush\t%d\n", *((int*)p->value));
				known = 1;
			}
			else if (p->type == typeCharchter) {
				fprintf( outFilePtr,"\tpush\t%c\n", *((char*)p->value));
				known = 1;
			}
			else
				known -= 1;
			break;
		case constantKind: 
			fprintf( outFilePtr,"\tpush\t%s\n", p->name); 
			break; 
		case identifierKind:
			known = 1; 
			fprintf( outFilePtr,"\tpush\t%s\n", p->name); 
			break; 
		case 4:
			switch(p->opr.oper){
				case '#':
					ex(p->opr.op[0]); 
					if(known != 1)
						fprintf( outFilePtr,"\tpush\tt%d\n", var++);	
					fprintf( outFilePtr,"\tpop\tr\n");
					break;
				case 'A':
					fprintf( outFilePtr,"\tpush\tr\n");
					ex(p->opr.op[0]);
					if(known < 1)
						fprintf( outFilePtr,"\tpush\tt%d\n", var++);	
					fprintf( outFilePtr,"\tcompEQ\tt%d\n",var); 
					fprintf( outFilePtr,"\tpush\tt%d\n", var);
					fprintf( outFilePtr,"\tjz\tL%03d\n", lbl2 = lbl++); 
					break;
				case 'B':
					fprintf( outFilePtr,"\tjmp\tS%03d\n", sCase); 
					break;
				case 'C':
					fprintf( outFilePtr,"S%03d:\n", sCase++);
					break; 
				case 'x':
					break;
				case 'w':
					fprintf( outFilePtr,"L%03d:\n", lbl1 = lbl++);
					break; 
				case 'h':
					operation = 0;
					fprintf( outFilePtr,"\tpush\tt%d\n", var);	 
					fprintf( outFilePtr,"\tjz\tL%03d\n", lbl2 = lbl++); 
					break; 
				case 'l':
					var = 0;
					arthLvl = -1;
					fprintf( outFilePtr,"\tjmp\tL%03d\n", lbl1); 
					fprintf( outFilePtr,"L%03d:\n", lbl2); 
					break;
				case 'i':
					var = 0;
					arthLvl = -1;
					fprintf( outFilePtr,"L%03d:\n", lbl2); 
					break; 
				case '@':
                    var = 0;
                    ex(p->opr.op[0]); 
                    fprintf( outFilePtr,"\tpop\tt%d\n", var);
                    break; 
				case '=':
					if(p->opr.nops > 1){
						ex(p->opr.op[1]);
					}
					if (operation == 1)
						fprintf( outFilePtr,"\tpush\tt%d\n", var);	 
					fprintf( outFilePtr,"\tpop\t%s\n", p->opr.op[0]->name);
					var = 0; 
					arthLvl = -1;
					operation = 0;
					break; 
				default:
					if (arthLvl == -1)
						inc = 1;
					// if (p->opr.oper == '!')
					// 	inc = 1;
					if (((p->opr.oper == '*' || p->opr.oper == '/')&& arthLvl == 1))
						inc = 0;
					if (((p->opr.oper == '+' || p->opr.oper == '-')&& arthLvl == 0)){
						inc = 0;	 
					}
					operation = 1;
					if (p->opr.nops == 0){
						var -= 1;
						fprintf( outFilePtr,"\tpush\tt%d\n",var++ );
						fprintf( outFilePtr,"\tpush\tt%d\n",var );
						var += inc;
					}
					else{
						if(p->opr.nops > 1){
							ex(p->opr.op[0]);
							if(known != 1){
								var -= 1;
								fprintf( outFilePtr,"\tpush\tt%d\n",var++ );
							}
							ex(p->opr.op[1]);
							if (known != 1){
								fprintf( outFilePtr,"\tpush\tt%d\n",var );
							}
							var += inc;
							
						} 
						else if(p->opr.nops == 1 && p->opr.oper != '!'){
							fprintf( outFilePtr,"\tpush\tt%d\n",var);
							ex(p->opr.op[0]);
							if(known == 0)
							{
								fprintf( outFilePtr,"\tpush\tt%d\n",var-1 );
							}
							var += inc;
						}
					}
					switch(p->opr.oper) { 
					case '+': fprintf( outFilePtr,"\tadd\tt%d\n",var); arthLvl = 0 ;break; 
					case '-': fprintf( outFilePtr,"\tsub\tt%d\n",var); arthLvl = 0 ; break; 
					case '*': fprintf( outFilePtr,"\tmul\tt%d\n",var); arthLvl = 1 ;break; 
					case '/': fprintf( outFilePtr,"\tdiv\tt%d\n",var); arthLvl = 1 ;break;
					case '!':
						ex(p->opr.op[0]);
						if (known != 1) 
							fprintf( outFilePtr,"\tpush\tt%d\n",var); 
						var += inc;
						fprintf( outFilePtr,"\tnot\tt%d\n",var); 
						break;  
					case '&': fprintf( outFilePtr,"\tand\tt%d\n",var); break; 
					case '|':  fprintf( outFilePtr,"\tor\tt%d\n",var); break;  
					case '<': fprintf( outFilePtr,"\tcompLT\tt%d\n",var); break; 
					case '>': fprintf( outFilePtr,"\tcompGT\tt%d\n",var); break; 
					case 'G': fprintf( outFilePtr,"\tcompGE\tt%d\n",var); break; 
					case 'L': fprintf( outFilePtr,"\tcompLE\tt%d\n",var); break; 
					case 'N': fprintf( outFilePtr,"\tcompNE\tt%d\n",var); break; 
					case 'E': fprintf( outFilePtr,"\tcompEQ\tt%d\n",var); break; 
					} 
				}
		} 
	return 0; 
}  
int Operations (char operation,int par1, int par2,int setPar, int setMulLvl){
	int tempInsert = valueIdxInsert;
	if ((operation == '+' || operation == '-') && mulDivLvl > 0)
		valueIdxInsert = valueIdxInsert - 1 - mulDivLvl;

	if (!setMulLvl)
		mulDivLvl = 0;

	int temp = valueIdx;
	valueIdx = valueIdxInsert - par;
	addToOperation(operation,"$","$");
	valueIdx = temp;
	if (setMulLvl)
		mulDivLvl += 1;
	if (setPar)
		par = 1;
	valueIdxInsert = tempInsert;
	return checkType(par1,par2,1); 
}
void addToOperation (char operation, char* par1, char* par2){
        int parameter2;
        if (par == 1 )
        {
                parameter2 = 1;
                if ( (operation == '*' || operation == '/')  && mulDivLvl == 0 )
                {
                        valueIdx--;
                        par = 2;
                }
        }
        if (par == 2)
                parameter2 = values[valueIdx + 1].type;
        int equalIndex = 1;
        if (operation == '=')
                equalIndex = 0;

        if(values[valueIdx].type != -1 && parameter2 != -1){
			opr(operation, par, par1, par2);
        }
        else if (values[valueIdx].type != -1 || (operation == '=')) {
			if (values[valueIdx + equalIndex].used == 1)
				opr(operation, par, par1, "#");
			else{
				values[valueIdx + equalIndex].used = 1;
				opr(operation, par, par1, values[valueIdx + equalIndex].name);
			} 	
			valueIdx ++;
        }
        else if (parameter2 != -1){
			valueIdx ++;
			if ( values[valueIdx-1].used == 1){
				opr(operation, par,  par2, "#"); 	
			}
			else{
				values[valueIdx-1].used = 1;
				opr(operation, par, values[valueIdx-1].name, par2); 
			}
        }
        else{
			if (values[valueIdx].used == 1 && values[valueIdx+1].used == 1)
				opr(operation, 0, "#", "#");
			else if (values[valueIdx].used == 1)
			{
				values[valueIdx+1].used = 1;
				opr(operation, par,  values[valueIdx+1].name , "#");
			}
			else if (values[valueIdx+1].used == 1)
			{
				values[valueIdx].used = 1;
				opr(operation, par, values[valueIdx].name, "#");
			} 	
			else{
				values[valueIdx].used = 1;
				values[valueIdx+1].used = 1;
				opr(operation, par, values[valueIdx].name, values[valueIdx+1].name);
			}
			valueIdx += 2;
        }
}
char * readFile(char* fileName){
	char * code = 0;
	long stringLength;
	char fileNameWithTXT [100];
	int i = 0;
	while (fileName[i] != '\0')
	{
		fileNameWithTXT[i] = fileName[i];
		i++;
	}
	fileNameWithTXT[i] = '.';
	fileNameWithTXT[i + 1] = 't';
	fileNameWithTXT[i + 2] = 'x';
	fileNameWithTXT[i + 3] = 't';
	fileNameWithTXT[i + 4] = '\0';
	
	FILE *inFilePtr = fopen(fileNameWithTXT,"rb");
	if (!inFilePtr)
	{
		printf("error in opening the input file\n");
		return NULL;
	}
	if (inFilePtr)
	{
		fseek (inFilePtr, 0, SEEK_END);
		stringLength = ftell (inFilePtr);
		fseek (inFilePtr, 0, SEEK_SET);
		code = malloc (stringLength + 1);
		if (code)
			fread (code, 1, stringLength, inFilePtr);
		code[stringLength] = '\0';
		fclose (inFilePtr);
	}
	return code;
}
//------------------------------------------------
int main(int argc, char **argv) {
	char *code = readFile(argv[1]);
	outFilePtr = fopen(strcat(argv[1],"Output.txt"),"w");
	if(!code)
	{
		fclose (outFilePtr);
		return 0;
	}
	YY_BUFFER_STATE buffer = yy_scan_string(code);
    yyparse();
    yy_delete_buffer(buffer);

	if(ext == 1)
	{
		fclose (outFilePtr);
		return 0;
	}
	fprintf( outFilePtr,"----------The file is compiled successfully-----\t\n");
	fprintf( outFilePtr,"----------Start Quadruples----------------------\t\n");
	for (int i = 0 ; i < idx ; i ++){
		if(symbol_table[i].kind == 4 && symbol_table[i].opr.oper == 'f'){
			symbol_table[i].opr.oper = 'h';
			ex(&(symbol_table[i]));
			for(int j = i + 1 ; j < idx ; j++){
				if(symbol_table[i].kind == 4 && symbol_table[j+2].opr.oper=='l'){
					operation = 0;
					ex(&(symbol_table[i+1]));
					ex(&(symbol_table[i+2]));
					i = j + 1;
					break;	
				}
				else if (symbol_table[j+2].kind == 4){
					ex(&(symbol_table[j+2]));
				}
			}
		}
		else if(symbol_table[i].kind == 4)
		{
			ex(&(symbol_table[i]));
		}
	}
	fprintf( outFilePtr,"-----------END Quadruples-----\t\n");
	fprintf( outFilePtr,"-----------Symbol Table-------\t\n");
    for (int i=0;i<idx;i++)
		if (symbol_table[i].kind!=4)
			fprintf( outFilePtr,"variable name: %s\t,scope: %d\t,is used: %d\n",symbol_table[i].name,symbol_table[i].scope,symbol_table[i].isUsed);
	fclose(outFilePtr);
    return 0;
}
