/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "parser.y"

    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(char *s);
    int yylex();

#line 78 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 211 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_IDENTIFIER = 3,                 /* IDENTIFIER  */
  YYSYMBOL_INT = 4,                        /* INT  */
  YYSYMBOL_BOOLEAN = 5,                    /* BOOLEAN  */
  YYSYMBOL_CHARACTER = 6,                  /* CHARACTER  */
  YYSYMBOL_FLOAT = 7,                      /* FLOAT  */
  YYSYMBOL_STRING = 8,                     /* STRING  */
  YYSYMBOL_CONSTANT = 9,                   /* CONSTANT  */
  YYSYMBOL_VOID = 10,                      /* VOID  */
  YYSYMBOL_INT_TYPE = 11,                  /* INT_TYPE  */
  YYSYMBOL_BOOLEAN_TYPE = 12,              /* BOOLEAN_TYPE  */
  YYSYMBOL_CHARACTER_TYPE = 13,            /* CHARACTER_TYPE  */
  YYSYMBOL_FLOAT_TYPE = 14,                /* FLOAT_TYPE  */
  YYSYMBOL_STRING_TYPE = 15,               /* STRING_TYPE  */
  YYSYMBOL_AND = 16,                       /* AND  */
  YYSYMBOL_OR = 17,                        /* OR  */
  YYSYMBOL_NOT = 18,                       /* NOT  */
  YYSYMBOL_EQUAL = 19,                     /* EQUAL  */
  YYSYMBOL_NOT_EQUAL = 20,                 /* NOT_EQUAL  */
  YYSYMBOL_GREATER_THAN = 21,              /* GREATER_THAN  */
  YYSYMBOL_LESS_THAN = 22,                 /* LESS_THAN  */
  YYSYMBOL_GREATER_EQUAL = 23,             /* GREATER_EQUAL  */
  YYSYMBOL_LESS_EQUAL = 24,                /* LESS_EQUAL  */
  YYSYMBOL_IF = 25,                        /* IF  */
  YYSYMBOL_ELSE = 26,                      /* ELSE  */
  YYSYMBOL_WHILE = 27,                     /* WHILE  */
  YYSYMBOL_FOR = 28,                       /* FOR  */
  YYSYMBOL_DO = 29,                        /* DO  */
  YYSYMBOL_SWITCH = 30,                    /* SWITCH  */
  YYSYMBOL_CASE = 31,                      /* CASE  */
  YYSYMBOL_DEFAULT = 32,                   /* DEFAULT  */
  YYSYMBOL_BREAK = 33,                     /* BREAK  */
  YYSYMBOL_FUNCTION = 34,                  /* FUNCTION  */
  YYSYMBOL_RETURN = 35,                    /* RETURN  */
  YYSYMBOL_36_ = 36,                       /* '='  */
  YYSYMBOL_37_ = 37,                       /* '-'  */
  YYSYMBOL_38_ = 38,                       /* '+'  */
  YYSYMBOL_39_ = 39,                       /* '*'  */
  YYSYMBOL_40_ = 40,                       /* '/'  */
  YYSYMBOL_41_ = 41,                       /* '%'  */
  YYSYMBOL_42_ = 42,                       /* '^'  */
  YYSYMBOL_ifpred = 43,                    /* ifpred  */
  YYSYMBOL_44_ = 44,                       /* ';'  */
  YYSYMBOL_45_ = 45,                       /* '{'  */
  YYSYMBOL_46_ = 46,                       /* '}'  */
  YYSYMBOL_47_ = 47,                       /* '('  */
  YYSYMBOL_48_ = 48,                       /* ')'  */
  YYSYMBOL_YYACCEPT = 49,                  /* $accept  */
  YYSYMBOL_program = 50,                   /* program  */
  YYSYMBOL_statements = 51,                /* statements  */
  YYSYMBOL_statement = 52,                 /* statement  */
  YYSYMBOL_block_statement = 53,           /* block_statement  */
  YYSYMBOL_while_statement = 54,           /* while_statement  */
  YYSYMBOL_if_statement = 55,              /* if_statement  */
  YYSYMBOL_matched_if = 56,                /* matched_if  */
  YYSYMBOL_unmatched_if = 57,              /* unmatched_if  */
  YYSYMBOL_for_statement = 58,             /* for_statement  */
  YYSYMBOL_for_iterator = 59,              /* for_iterator  */
  YYSYMBOL_data_type = 60,                 /* data_type  */
  YYSYMBOL_declaration_statement = 61,     /* declaration_statement  */
  YYSYMBOL_data_value = 62,                /* data_value  */
  YYSYMBOL_expression_statement = 63,      /* expression_statement  */
  YYSYMBOL_logical_expression = 64         /* logical_expression  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  40
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   468

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  49
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  16
/* YYNRULES -- Number of rules.  */
#define YYNRULES  56
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  114

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   291


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,    41,     2,     2,
      47,    48,    39,    38,     2,    37,     2,    40,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    44,
       2,    36,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    42,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    45,     2,    46,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    43
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    67,    67,    68,    71,    72,    73,    74,    77,    78,
      79,    80,    81,    82,    85,    86,    89,    92,    93,    96,
      97,    98,   101,   102,   105,   108,   109,   112,   113,   114,
     115,   116,   119,   120,   121,   124,   125,   126,   127,   128,
     131,   132,   133,   134,   137,   138,   139,   140,   141,   142,
     143,   144,   145,   146,   147,   148,   149
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "IDENTIFIER", "INT",
  "BOOLEAN", "CHARACTER", "FLOAT", "STRING", "CONSTANT", "VOID",
  "INT_TYPE", "BOOLEAN_TYPE", "CHARACTER_TYPE", "FLOAT_TYPE",
  "STRING_TYPE", "AND", "OR", "NOT", "EQUAL", "NOT_EQUAL", "GREATER_THAN",
  "LESS_THAN", "GREATER_EQUAL", "LESS_EQUAL", "IF", "ELSE", "WHILE", "FOR",
  "DO", "SWITCH", "CASE", "DEFAULT", "BREAK", "FUNCTION", "RETURN", "'='",
  "'-'", "'+'", "'*'", "'/'", "'%'", "'^'", "ifpred", "';'", "'{'", "'}'",
  "'('", "')'", "$accept", "program", "statements", "statement",
  "block_statement", "while_statement", "if_statement", "matched_if",
  "unmatched_if", "for_statement", "for_iterator", "data_type",
  "declaration_statement", "data_value", "expression_statement",
  "logical_expression", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-83)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     205,   -83,   -83,   -83,   -83,   -83,   -83,     7,   -83,   -83,
     -83,   -83,   -83,   -44,   -43,   -42,   -83,   101,    21,     8,
     205,   -83,   -83,   -83,   -83,   -83,   -83,   -83,     4,   -35,
     -83,   387,   -83,    13,    21,    21,   231,   -83,   127,   237,
     -83,   205,   -83,   -83,   -15,   -83,    21,    21,    21,    21,
      21,    21,    21,    21,    21,    21,    21,    21,    21,   -83,
     -11,   267,   297,   -14,   -83,   422,   -83,   -83,    21,   428,
     428,    14,    14,    14,    14,    14,    14,   422,   -83,   -83,
     -83,   -83,    21,    10,    11,    21,   422,   422,   205,   -83,
     396,   153,    -9,    21,     5,    31,   327,    16,    17,    11,
     205,    33,   -83,    18,    12,    20,   -83,    21,   -83,   357,
      22,   205,   179,   -83
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       2,    41,    27,    29,    30,    28,    31,     0,    35,    37,
      38,    36,    39,     0,     0,     0,     8,     0,     0,     0,
       3,     4,     6,     9,    10,    17,    18,    11,     0,     0,
      42,     0,    43,     0,     0,     0,     0,    14,     0,     0,
       1,    20,     4,     6,    32,    12,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    13,
       0,     0,     0,     0,    26,    25,    15,    40,     0,    49,
      50,    55,    56,    51,    52,    53,    54,    44,    46,    45,
      47,    48,     0,     0,     0,     0,    33,    34,    21,    16,
       0,     0,    17,     0,    22,     0,     0,     0,     0,     0,
      21,     0,    24,    17,     0,     0,    19,     0,    23,     0,
       0,    21,     0,    22
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -83,   -83,     0,   -18,   -19,   -83,   -83,   -82,   -38,   -83,
     -83,    62,    34,   -83,    -8,   -83
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,    19,    41,    21,    22,    23,    24,    25,    26,    27,
      63,    28,    29,    30,    31,    32
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      20,    43,    42,    34,    35,    36,    92,    44,    40,    45,
      39,     2,     3,     4,     5,     6,    60,    38,   103,    43,
      42,    68,    43,    42,     1,    82,    61,    62,    65,    92,
      85,    97,     8,     9,    10,    11,    12,    95,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    55,    56,    57,    58,    88,    17,    98,   104,   107,
      86,   100,   101,   105,   106,    89,   108,   111,    18,    33,
      64,     0,    43,    42,    87,     0,     0,    90,     0,     0,
     102,     0,     0,     0,     0,    96,     0,     0,    91,     0,
       0,     0,     0,    43,    42,     0,     0,     0,     0,   109,
       0,     0,     0,     0,     1,     2,     3,     4,     5,     6,
       7,   112,     8,     9,    10,    11,    12,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    13,     0,    14,    15,
       1,     2,     3,     4,     5,     6,     7,     0,     8,     9,
      10,    11,    12,     0,     0,    16,    17,    37,    18,     0,
       0,     0,    13,     0,    14,    15,     1,     2,     3,     4,
       5,     6,     7,     0,     8,     9,    10,    11,    12,     0,
       0,    16,    17,    66,    18,     0,     0,     0,    13,     0,
      14,    15,     1,     2,     3,     4,     5,     6,     7,     0,
       8,     9,    10,    11,    12,     0,     0,    16,    17,    94,
      18,     0,     0,     0,    13,     0,    14,    15,     1,     2,
       3,     4,     5,     6,     7,     0,     8,     9,    10,    11,
      12,     0,     0,    16,    17,   113,    18,     0,     0,     0,
      13,     0,    14,    15,     1,     2,     3,     4,     5,     6,
       7,     0,     8,     9,    10,    11,    12,     0,     0,    16,
      17,     0,    18,    46,    47,     0,    48,    49,    50,    51,
      52,    53,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    54,    55,    56,    57,    58,    18,     0,
       0,     0,     0,    46,    47,    67,    48,    49,    50,    51,
      52,    53,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    54,    55,    56,    57,    58,     0,     0,
       0,     0,     0,    46,    47,    83,    48,    49,    50,    51,
      52,    53,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    54,    55,    56,    57,    58,     0,     0,
       0,     0,     0,    46,    47,    84,    48,    49,    50,    51,
      52,    53,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    54,    55,    56,    57,    58,     0,     0,
       0,     0,     0,    46,    47,    99,    48,    49,    50,    51,
      52,    53,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    54,    55,    56,    57,    58,     0,     0,
       0,     0,     0,    46,    47,   110,    48,    49,    50,    51,
      52,    53,    46,    47,     0,    48,    49,    50,    51,    52,
      53,     0,     0,    54,    55,    56,    57,    58,     0,     0,
       0,    59,    54,    55,    56,    57,    58,     0,    46,    47,
      93,    48,    49,    50,    51,    52,    53,    48,    49,    50,
      51,    52,    53,     0,     0,     0,     0,     0,    54,    55,
      56,    57,    58,     0,     0,    55,    56,    57,    58
};

static const yytype_int8 yycheck[] =
{
       0,    20,    20,    47,    47,    47,    88,     3,     0,    44,
      18,     4,     5,     6,     7,     8,     3,    17,   100,    38,
      38,    36,    41,    41,     3,    36,    34,    35,    36,   111,
      44,    26,    11,    12,    13,    14,    15,    46,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    37,    38,    39,    40,    45,    45,    26,    25,    47,
      68,    45,    45,   101,    46,    84,    46,    45,    47,     7,
      36,    -1,    91,    91,    82,    -1,    -1,    85,    -1,    -1,
      99,    -1,    -1,    -1,    -1,    93,    -1,    -1,    88,    -1,
      -1,    -1,    -1,   112,   112,    -1,    -1,    -1,    -1,   107,
      -1,    -1,    -1,    -1,     3,     4,     5,     6,     7,     8,
       9,   111,    11,    12,    13,    14,    15,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    25,    -1,    27,    28,
       3,     4,     5,     6,     7,     8,     9,    -1,    11,    12,
      13,    14,    15,    -1,    -1,    44,    45,    46,    47,    -1,
      -1,    -1,    25,    -1,    27,    28,     3,     4,     5,     6,
       7,     8,     9,    -1,    11,    12,    13,    14,    15,    -1,
      -1,    44,    45,    46,    47,    -1,    -1,    -1,    25,    -1,
      27,    28,     3,     4,     5,     6,     7,     8,     9,    -1,
      11,    12,    13,    14,    15,    -1,    -1,    44,    45,    46,
      47,    -1,    -1,    -1,    25,    -1,    27,    28,     3,     4,
       5,     6,     7,     8,     9,    -1,    11,    12,    13,    14,
      15,    -1,    -1,    44,    45,    46,    47,    -1,    -1,    -1,
      25,    -1,    27,    28,     3,     4,     5,     6,     7,     8,
       9,    -1,    11,    12,    13,    14,    15,    -1,    -1,    44,
      45,    -1,    47,    16,    17,    -1,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    37,    38,    39,    40,    47,    -1,
      -1,    -1,    -1,    16,    17,    48,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    37,    38,    39,    40,    -1,    -1,
      -1,    -1,    -1,    16,    17,    48,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    37,    38,    39,    40,    -1,    -1,
      -1,    -1,    -1,    16,    17,    48,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    37,    38,    39,    40,    -1,    -1,
      -1,    -1,    -1,    16,    17,    48,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    37,    38,    39,    40,    -1,    -1,
      -1,    -1,    -1,    16,    17,    48,    19,    20,    21,    22,
      23,    24,    16,    17,    -1,    19,    20,    21,    22,    23,
      24,    -1,    -1,    36,    37,    38,    39,    40,    -1,    -1,
      -1,    44,    36,    37,    38,    39,    40,    -1,    16,    17,
      44,    19,    20,    21,    22,    23,    24,    19,    20,    21,
      22,    23,    24,    -1,    -1,    -1,    -1,    -1,    36,    37,
      38,    39,    40,    -1,    -1,    37,    38,    39,    40
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     5,     6,     7,     8,     9,    11,    12,
      13,    14,    15,    25,    27,    28,    44,    45,    47,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    60,    61,
      62,    63,    64,    60,    47,    47,    47,    46,    51,    63,
       0,    51,    52,    53,     3,    44,    16,    17,    19,    20,
      21,    22,    23,    24,    36,    37,    38,    39,    40,    44,
       3,    63,    63,    59,    61,    63,    46,    48,    36,    63,
      63,    63,    63,    63,    63,    63,    63,    63,    63,    63,
      63,    63,    36,    48,    48,    44,    63,    63,    45,    53,
      63,    51,    56,    44,    46,    46,    63,    26,    26,    48,
      45,    45,    53,    56,    25,    57,    46,    47,    46,    63,
      48,    45,    51,    46
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    49,    50,    50,    51,    51,    51,    51,    52,    52,
      52,    52,    52,    52,    53,    53,    54,    55,    55,    56,
      56,    56,    57,    57,    58,    59,    59,    60,    60,    60,
      60,    60,    61,    61,    61,    62,    62,    62,    62,    62,
      63,    63,    63,    63,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    64,    64
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     1,     1,     2,     1,     2,     1,     1,
       1,     1,     2,     2,     2,     3,     5,     1,     1,    11,
       1,     0,     7,    11,     9,     1,     1,     1,     1,     1,
       1,     1,     2,     4,     5,     1,     1,     1,     1,     1,
       3,     1,     1,     1,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 3: /* program: statements  */
#line 68 "parser.y"
                                                    {printf("statements");}
#line 1396 "y.tab.c"
    break;

  case 4: /* statements: statement  */
#line 71 "parser.y"
                                                    {printf("statement\n");}
#line 1402 "y.tab.c"
    break;

  case 5: /* statements: statements statement  */
#line 72 "parser.y"
                                                    {printf("statements -> statement");}
#line 1408 "y.tab.c"
    break;

  case 6: /* statements: block_statement  */
#line 73 "parser.y"
                                                    {printf("block statement");}
#line 1414 "y.tab.c"
    break;

  case 7: /* statements: statements block_statement  */
#line 74 "parser.y"
                                                    {printf("statements -> block statement");}
#line 1420 "y.tab.c"
    break;

  case 8: /* statement: ';'  */
#line 77 "parser.y"
                                                    {;}
#line 1426 "y.tab.c"
    break;

  case 9: /* statement: while_statement  */
#line 78 "parser.y"
                                                    {;}
#line 1432 "y.tab.c"
    break;

  case 10: /* statement: if_statement  */
#line 79 "parser.y"
                                                    {printf("If statement\n");}
#line 1438 "y.tab.c"
    break;

  case 11: /* statement: for_statement  */
#line 80 "parser.y"
                                                    {;}
#line 1444 "y.tab.c"
    break;

  case 12: /* statement: declaration_statement ';'  */
#line 81 "parser.y"
                                                        {printf("variable declaration\n");}
#line 1450 "y.tab.c"
    break;

  case 13: /* statement: expression_statement ';'  */
#line 82 "parser.y"
                                                        {;}
#line 1456 "y.tab.c"
    break;

  case 14: /* block_statement: '{' '}'  */
#line 85 "parser.y"
                                {;}
#line 1462 "y.tab.c"
    break;

  case 15: /* block_statement: '{' statements '}'  */
#line 86 "parser.y"
                                {;}
#line 1468 "y.tab.c"
    break;

  case 16: /* while_statement: WHILE '(' expression_statement ')' block_statement  */
#line 89 "parser.y"
                                                                    {;}
#line 1474 "y.tab.c"
    break;

  case 17: /* if_statement: matched_if  */
#line 92 "parser.y"
                                                    {printf("matched if\n");}
#line 1480 "y.tab.c"
    break;

  case 18: /* if_statement: unmatched_if  */
#line 93 "parser.y"
                                                    {printf("unmatched if\n");}
#line 1486 "y.tab.c"
    break;

  case 19: /* matched_if: IF '(' expression_statement ')' '{' statements '}' ELSE '{' matched_if '}'  */
#line 96 "parser.y"
                                                                                                            {printf("matched_if\n");}
#line 1492 "y.tab.c"
    break;

  case 20: /* matched_if: statements  */
#line 97 "parser.y"
                                {printf("matched_if statements");}
#line 1498 "y.tab.c"
    break;

  case 21: /* matched_if: %empty  */
#line 98 "parser.y"
                                {printf("matched_if empty\n");}
#line 1504 "y.tab.c"
    break;

  case 22: /* unmatched_if: IF '(' expression_statement ')' '{' statements '}'  */
#line 101 "parser.y"
                                                                            {printf("unmatched_if");}
#line 1510 "y.tab.c"
    break;

  case 23: /* unmatched_if: IF '(' expression_statement ')' '{' matched_if '}' ELSE '{' unmatched_if '}'  */
#line 102 "parser.y"
                                                                                       {printf("matched_if\n");}
#line 1516 "y.tab.c"
    break;

  case 24: /* for_statement: FOR '(' for_iterator ';' expression_statement ';' expression_statement ')' block_statement  */
#line 105 "parser.y"
                                                                                                                    {;}
#line 1522 "y.tab.c"
    break;

  case 25: /* for_iterator: expression_statement  */
#line 108 "parser.y"
                                            {;}
#line 1528 "y.tab.c"
    break;

  case 26: /* for_iterator: declaration_statement  */
#line 109 "parser.y"
                                            {;}
#line 1534 "y.tab.c"
    break;

  case 27: /* data_type: INT  */
#line 112 "parser.y"
                    {;}
#line 1540 "y.tab.c"
    break;

  case 28: /* data_type: FLOAT  */
#line 113 "parser.y"
                    {;}
#line 1546 "y.tab.c"
    break;

  case 29: /* data_type: BOOLEAN  */
#line 114 "parser.y"
                    {;}
#line 1552 "y.tab.c"
    break;

  case 30: /* data_type: CHARACTER  */
#line 115 "parser.y"
                    {;}
#line 1558 "y.tab.c"
    break;

  case 31: /* data_type: STRING  */
#line 116 "parser.y"
                    {;}
#line 1564 "y.tab.c"
    break;

  case 32: /* declaration_statement: data_type IDENTIFIER  */
#line 119 "parser.y"
                                                                    {printf("variable declaration");}
#line 1570 "y.tab.c"
    break;

  case 33: /* declaration_statement: data_type IDENTIFIER '=' expression_statement  */
#line 120 "parser.y"
                                                                    {;}
#line 1576 "y.tab.c"
    break;

  case 34: /* declaration_statement: CONSTANT data_type IDENTIFIER '=' expression_statement  */
#line 121 "parser.y"
                                                                    {;}
#line 1582 "y.tab.c"
    break;

  case 35: /* data_value: INT_TYPE  */
#line 124 "parser.y"
                            {;}
#line 1588 "y.tab.c"
    break;

  case 36: /* data_value: FLOAT_TYPE  */
#line 125 "parser.y"
                            {;}
#line 1594 "y.tab.c"
    break;

  case 37: /* data_value: BOOLEAN_TYPE  */
#line 126 "parser.y"
                            {;}
#line 1600 "y.tab.c"
    break;

  case 38: /* data_value: CHARACTER_TYPE  */
#line 127 "parser.y"
                            {;}
#line 1606 "y.tab.c"
    break;

  case 39: /* data_value: STRING_TYPE  */
#line 128 "parser.y"
                            {;}
#line 1612 "y.tab.c"
    break;

  case 40: /* expression_statement: '(' expression_statement ')'  */
#line 131 "parser.y"
                                                                    {;}
#line 1618 "y.tab.c"
    break;

  case 41: /* expression_statement: IDENTIFIER  */
#line 132 "parser.y"
                                                                    {printf("identifier");}
#line 1624 "y.tab.c"
    break;

  case 42: /* expression_statement: data_value  */
#line 133 "parser.y"
                                                                    {;}
#line 1630 "y.tab.c"
    break;

  case 43: /* expression_statement: logical_expression  */
#line 134 "parser.y"
                                                                    {;}
#line 1636 "y.tab.c"
    break;

  case 44: /* logical_expression: expression_statement '=' expression_statement  */
#line 137 "parser.y"
                                                                        {printf("assignment");}
#line 1642 "y.tab.c"
    break;

  case 45: /* logical_expression: expression_statement '+' expression_statement  */
#line 138 "parser.y"
                                                                        {;}
#line 1648 "y.tab.c"
    break;

  case 46: /* logical_expression: expression_statement '-' expression_statement  */
#line 139 "parser.y"
                                                                        {;}
#line 1654 "y.tab.c"
    break;

  case 47: /* logical_expression: expression_statement '*' expression_statement  */
#line 140 "parser.y"
                                                                        {;}
#line 1660 "y.tab.c"
    break;

  case 48: /* logical_expression: expression_statement '/' expression_statement  */
#line 141 "parser.y"
                                                                        {;}
#line 1666 "y.tab.c"
    break;

  case 49: /* logical_expression: expression_statement AND expression_statement  */
#line 142 "parser.y"
                                                                        {;}
#line 1672 "y.tab.c"
    break;

  case 50: /* logical_expression: expression_statement OR expression_statement  */
#line 143 "parser.y"
                                                                        {;}
#line 1678 "y.tab.c"
    break;

  case 51: /* logical_expression: expression_statement GREATER_THAN expression_statement  */
#line 144 "parser.y"
                                                                        {;}
#line 1684 "y.tab.c"
    break;

  case 52: /* logical_expression: expression_statement LESS_THAN expression_statement  */
#line 145 "parser.y"
                                                                        {;}
#line 1690 "y.tab.c"
    break;

  case 53: /* logical_expression: expression_statement GREATER_EQUAL expression_statement  */
#line 146 "parser.y"
                                                                        {;}
#line 1696 "y.tab.c"
    break;

  case 54: /* logical_expression: expression_statement LESS_EQUAL expression_statement  */
#line 147 "parser.y"
                                                                        {;}
#line 1702 "y.tab.c"
    break;

  case 55: /* logical_expression: expression_statement EQUAL expression_statement  */
#line 148 "parser.y"
                                                                        {;}
#line 1708 "y.tab.c"
    break;

  case 56: /* logical_expression: expression_statement NOT_EQUAL expression_statement  */
#line 149 "parser.y"
                                                                        {;}
#line 1714 "y.tab.c"
    break;


#line 1718 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 153 "parser.y"


void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
