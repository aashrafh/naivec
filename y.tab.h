/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    INT = 259,                     /* INT  */
    BOOLEAN = 260,                 /* BOOLEAN  */
    CHARACTER = 261,               /* CHARACTER  */
    FLOAT = 262,                   /* FLOAT  */
    STRING = 263,                  /* STRING  */
    CONSTANT = 264,                /* CONSTANT  */
    VOID = 265,                    /* VOID  */
    INT_TYPE = 266,                /* INT_TYPE  */
    BOOLEAN_TYPE = 267,            /* BOOLEAN_TYPE  */
    CHARACTER_TYPE = 268,          /* CHARACTER_TYPE  */
    FLOAT_TYPE = 269,              /* FLOAT_TYPE  */
    STRING_TYPE = 270,             /* STRING_TYPE  */
    AND = 271,                     /* AND  */
    OR = 272,                      /* OR  */
    NOT = 273,                     /* NOT  */
    EQUAL = 274,                   /* EQUAL  */
    NOT_EQUAL = 275,               /* NOT_EQUAL  */
    GREATER_THAN = 276,            /* GREATER_THAN  */
    LESS_THAN = 277,               /* LESS_THAN  */
    GREATER_EQUAL = 278,           /* GREATER_EQUAL  */
    LESS_EQUAL = 279,              /* LESS_EQUAL  */
    IF = 280,                      /* IF  */
    ELSE = 281,                    /* ELSE  */
    WHILE = 282,                   /* WHILE  */
    FOR = 283,                     /* FOR  */
    DO = 284,                      /* DO  */
    SWITCH = 285,                  /* SWITCH  */
    CASE = 286,                    /* CASE  */
    DEFAULT = 287,                 /* DEFAULT  */
    BREAK = 288,                   /* BREAK  */
    FUNCTION = 289,                /* FUNCTION  */
    RETURN = 290,                  /* RETURN  */
    ifpred = 291                   /* ifpred  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define IDENTIFIER 258
#define INT 259
#define BOOLEAN 260
#define CHARACTER 261
#define FLOAT 262
#define STRING 263
#define CONSTANT 264
#define VOID 265
#define INT_TYPE 266
#define BOOLEAN_TYPE 267
#define CHARACTER_TYPE 268
#define FLOAT_TYPE 269
#define STRING_TYPE 270
#define AND 271
#define OR 272
#define NOT 273
#define EQUAL 274
#define NOT_EQUAL 275
#define GREATER_THAN 276
#define LESS_THAN 277
#define GREATER_EQUAL 278
#define LESS_EQUAL 279
#define IF 280
#define ELSE 281
#define WHILE 282
#define FOR 283
#define DO 284
#define SWITCH 285
#define CASE 286
#define DEFAULT 287
#define BREAK 288
#define FUNCTION 289
#define RETURN 290
#define ifpred 291

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 8 "parser.y"

    int inVal;
    bool boolVal;
    char charVal;
    float floatVal;
    char* stringVal;

#line 147 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
